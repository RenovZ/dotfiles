#!/bin/bash

res="$( \
    RG_PREFIX="rg --column \
        --hidden \
        --line-number \
        --no-heading \
        --no-ignore \
        --glob '!.git/*' \
        --color=always \
        --smart-case "
    preview="
        filepath=\$(echo {}|awk -F ':' '{print \$1}')
        currentline=\$(echo {}|awk -F : '{print \$2}')
        startline=\$([ \$currentline -ge 20 ] && expr \$currentline - 20 || expr 0)
        # endline=\$(expr \$currentline + 10)
        # bat -n --line-range \$startline:\$endline --highlight-line \$currentline --color always \$filepath
        bat -n --line-range \$startline: --highlight-line \$currentline --color always \$filepath
    "
    FZF_DEFAULT_COMMAND="$RG_PREFIX ''" \
        fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --header 'Search in files' \
        --preview "$preview" \
        | cut -d':' -f1
)"
[ ! -z "$res" ] && lf -remote "send $id select \"$res\""