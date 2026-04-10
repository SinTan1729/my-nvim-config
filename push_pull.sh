#!/usr/bin/env bash

DIR="$HOME/Code/git/my-nvim-config"

set -e

if [ "$1" = "push" ]; then
    echo "Sending to laptop..."
    cd ~/.config/nvim
    git fetch origin
    git reset --hard origin/private
    git clean -fd
    rm -f *.sh *md LICENSE Makefile
    git log -1 --pretty=%B | grep -q 'chore: Updated nvim-pack-lock.json' &&
        echo "Updating plugins in neovim..." &&
        nvim --headless +ZRestore +w +qa &>/dev/null
    echo "Cleaning plugins in neovim..."
    nvim --headless +ZClean +qa &>/dev/null
    for server in server vps pi3b pizero; do
        echo "Trying to connect to $server..."
        if ping -qc2 -W5 $server-ts >/dev/null; then
            echo "Sending to $server..."
            ssh $server-ts-plain -T /bin/bash <<'EOF'
                cd ~/.config/nvim
                git fetch origin
                git reset --hard origin/main
                git clean -fd
                rm -rf snips
                rm -f *md LICENSE
                git log -1 --pretty=%B | grep -q 'chore: Updated nvim-pack-lock.json' &&
                    echo "Updating plugins in neovim..." &&
                    nvim --headless +ZRestore +w +qa &>/dev/null
                echo "Cleaning plugins in neovim..."
                nvim --headless +ZClean +qa &>/dev/null
EOF
        else
            echo "Could not connect to $server!"
        fi
    done
elif [ "$1" = "push-local" ]; then
    echo "Sending to laptop locally..."
    rsync -achP --exclude={'*.md','*.sh','LICENSE','.*'} "$DIR/" "$HOME/.config/nvim/" --delete
elif [ "$1" = "pull" ]; then
    echo "Pulling from laptop..."
    rsync -achP --delete \
        --exclude='.git' \
        --filter='P *.sh' --filter='P *.md' \
        --filter='P LICENSE' --filter='P .*' \
        "$HOME/.config/nvim/" "$DIR/"
else
    echo "Please supply push/pull."
fi
