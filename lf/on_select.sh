#!/bin/bash
stat="$(eza -ld --color=always --icons=always "$f" 2>/dev/null || ls -ld --color=always "$f" 2>/dev/null || ls -ld "$f")"
if git rev-parse --git-dir >/dev/null 2>&1; then
    gs="$(git status --porcelain -- "$f" 2>/dev/null)"
    if [ -n "$gs" ]; then
        xy="$(echo "$gs" | head -1 | cut -c1-2)"
        E="$(printf '\033')"
        case "$xy" in
            "M "|"MM") indicator="${E}[1;32m[staged]${E}[0m" ;;
            " M")         indicator="${E}[1;33m[modified]${E}[0m" ;;
            "A ")         indicator="${E}[1;32m[added]${E}[0m" ;;
            "D ")         indicator="${E}[1;31m[deleted]${E}[0m" ;;
            " D")         indicator="${E}[1;31m[rm-staged]${E}[0m" ;;
            "R ")         indicator="${E}[1;35m[renamed]${E}[0m" ;;
            "C ")         indicator="${E}[1;35m[copied]${E}[0m" ;;
            "??")         indicator="${E}[1;37m[untracked]${E}[0m" ;;
            "!!")         indicator="${E}[2m[ignored]${E}[0m" ;;
            *)             indicator="[$xy]" ;;
        esac
        stat="$stat $indicator"
    fi
    last="$(git log -1 --format='%h %s' -- "$f" 2>/dev/null)"
    [ -n "$last" ] && stat="$stat | $last"
elif [ -d "$f" ] && git -C "$f" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    if git -C "$f" rev-parse HEAD >/dev/null 2>&1; then
        remote_count="$(git -C "$f" remote 2>/dev/null | wc -l | tr -d ' ')"
        if [ "$remote_count" -gt 0 ]; then
            remote="$(git -C "$f" remote get-url origin 2>/dev/null || git -C "$f" remote get-url "$(git -C "$f" remote 2>/dev/null | head -1)")"
            [ "$remote_count" -gt 1 ] && remote="$remote (+$((remote_count - 1)))"
        else
            remote="no remote"
        fi
        branch="$(git -C "$f" branch --show-current 2>/dev/null)"
        [ -z "$branch" ] && branch="$(git -C "$f" rev-parse --short HEAD 2>/dev/null)"
        commits="$(git -C "$f" rev-list --count HEAD 2>/dev/null)"
        authors="$(git -C "$f" log --format='%aN' 2>/dev/null | sort -u | wc -l | tr -d ' ')"
        last_commit="$(git -C "$f" log -1 --format='%h %s' 2>/dev/null)"
        changed="$(git -C "$f" diff --shortstat HEAD 2>/dev/null)"
        if [ -n "$changed" ]; then
            files="$(echo "$changed" | grep -o '[0-9]* file' | grep -o '[0-9]*')"
            insertions="$(echo "$changed" | grep -o '[0-9]* insertion' | grep -o '[0-9]*')"
            deletions="$(echo "$changed" | grep -o '[0-9]* deletion' | grep -o '[0-9]*')"
            changed=" | ${files}f"
            [ -n "$insertions" ] && changed="$changed +$insertions"
            [ -n "$deletions" ] && changed="$changed -$deletions"
        fi
        stat="$stat | git: $remote | $branch | ${commits}c ${authors}a | $last_commit$changed"
    fi
fi
lf -remote "send $id set user_status \"$stat\""
