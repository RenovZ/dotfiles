#!/bin/bash
cmd="rg --column --line-number --no-heading --color=always --smart-case"
fzf --ansi --disabled --layout=reverse --header="Search in files" --delimiter=: \
    --bind="start:reload([ -n {q} ] && $cmd -- {q} || true)" \
    --bind="change:reload([ -n {q} ] && $cmd -- {q} || true)" \
    --bind='enter:become(lf -remote "send $id select \"$(printf "%s" {1} | sed '\''s/\\/\\\\/g;s/"/\\"/g'\'')\"")' \
    --preview='bat --color=always --style=numbers --highlight-line={2} -- {1}' \
    --preview-window='+{2}-/2'
