#!/usr/bin/env bash

DIR="$HOME/Code/git/my-nvim-config"

set -e

if [ "$1" = "push" ]; then
    echo "Sending to laptop..."
    cd ~/.config/nvim
    git fetch origin
    git reset --hard origin/private
    git clean -fd
    rm -f *.sh *md LICENSE
    for server in server vps pi3b pizero; do
        if ping -qc2 -W5 $server-ts >/dev/null; then
            echo "Sending to $server..."
            ssh $server-ts-plain -T /bin/bash <<'EOF'
                cd ~/.config/nvim
                git fetch origin
                git reset --hard origin/main
                git clean -fd
                rm -rf snips
                rm -f *md LICENSE
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
