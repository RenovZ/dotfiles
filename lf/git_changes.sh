#!/bin/bash
if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "Not a git repository."
    exit 0
fi

preview='
    file=$(printf "%s\n" "{}" | cut -c4- | sed "s/.* -> //")
    if ! git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
        bat --color=always --style=plain "$file" 2>/dev/null || echo "New/untracked file"
    else
        dt="--dark"; [ "$(darklight 2>/dev/null)" = "Light" ] && dt="--light"; git diff HEAD -- "$file" 2>/dev/null | delta $dt --features 'line-numbers decorations' --file-style=omit --hunk-header-style=omit --paging=never --width="$FZF_PREVIEW_COLUMNS" 2>/dev/null | tail -n +2 || echo "(binary or no diff)"
    fi
'

selected=$(git -c color.status=always status --short | \
    fzf --multi \
        --ansi \
        --header='Changed Files  (enter: open | tab: multi-select | ctrl-d: diff in pager)' \
        --preview "$preview" \
        --preview-window='right:55%:wrap' \
        --bind='ctrl-d:execute(
            file=$(printf "%s\n" "{}" | cut -c4- | sed "s/.* -> //")
            git diff --color=always HEAD -- "$file" 2>/dev/null | less -R
        )+abort')

if [ -n "$selected" ]; then
    target=$(echo "$selected" | cut -c4- | sed 's/.* -> //')
    [ -z "$target" ] && target=$(echo "$selected" | cut -c4-)
    target=$(echo "$target" | sed 's/\\/\\\\/g;s/"/\\"/g')
    lf -remote "send $id select \"$target\""
fi
