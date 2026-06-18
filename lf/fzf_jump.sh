#!/bin/bash
res="$(fd --type d \
    --hidden \
    --no-ignore \
    --exclude '.git' \
    --ignore-case \
    | fzf --header='Jump to location' | sed 's/\\/\\\\/g;s/"/\\"/g')"
if [ -d "$res" ] ; then
    cmd="cd"
elif [ -f "$res" ] ; then
    cmd="select"
else
    exit 0
fi
lf -remote "send $id $cmd \"$res\""
