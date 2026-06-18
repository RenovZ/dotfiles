#!/bin/bash
# Unified fd search for lf
# Usage: fd_search.sh [extra fd flags...]

res="$( \
    FD_PREFIX="fd --color=always \
        --type f \
        --exclude '.git' \
        --ignore-case \
        $*"
    preview="bat --color=always --style=numbers {}"
    FZF_DEFAULT_COMMAND="$FD_PREFIX ''" \
        fzf --bind "change:reload:$FD_PREFIX {q} || true" \
        --ansi --header 'Search in files' \
        --preview "$preview" \
        | cut -d':' -f1
)"
[ ! -z "$res" ] && lf -remote "send $id select \"$res\""
