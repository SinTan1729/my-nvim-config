DIR="$HOME/Code/git/my-nvim-config"

set -e

if [ "$1" = "push" ]; then
    echo "Sending to laptop..."
    rsync -achP --exclude={'*.md','*.sh','LICENSE','.*'} "$DIR/" "$HOME/.config/nvim/" --delete-excluded
    [ "$2" = "laptop-only" ] && exit
    for server in server vps pi3b pizero; do
        if ping -qc2 -W5 $server-ts >/dev/null; then
            echo "Sending to $server..."
            rsync -achP --exclude={'*.md','*.sh','LICENSE','.*','snips/','spell/'} "$DIR/" $server-ts-rsync:"~/.config/nvim/" --delete-excluded
        else
            echo "Could not connect to $server!"
        fi
    done
elif [ "$1" = "pull" ]; then
    echo "Pulling from laptop..."
    rsync -achP --delete \
        --filter='P *.sh' --filter='P *.md' \
        --filter='P LICENSE' --filter='P .*' \
        "$HOME/.config/nvim/" "$DIR/"
else
    echo "Please supply push/pull."
fi
