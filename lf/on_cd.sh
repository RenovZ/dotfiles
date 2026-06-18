#!/bin/bash
if git rev-parse --is-inside-work-tree >/dev/null 2>&1 && git rev-parse HEAD >/dev/null 2>&1; then
    remote_count="$(git remote 2>/dev/null | wc -l | tr -d ' ')"
    if [ "$remote_count" -gt 0 ]; then
        remote="$(git remote get-url origin 2>/dev/null || git remote get-url "$(git remote 2>/dev/null | head -1)")"
        [ "$remote_count" -gt 1 ] && remote="$remote (+$((remote_count - 1)))"
    else
        remote="no remote"
    fi
    branch="$(git branch --show-current 2>/dev/null)"
    [ -z "$branch" ] && branch="$(git rev-parse --short HEAD 2>/dev/null)"
    commits="$(git rev-list --count HEAD 2>/dev/null)"
    authors="$(git log --format='%aN' 2>/dev/null | sort -u | wc -l | tr -d ' ')"
    last="$(git log -1 --format='%h %s' 2>/dev/null)"
    changed="$(git diff --shortstat HEAD 2>/dev/null)"
    if [ -n "$changed" ]; then
        files="$(echo "$changed" | grep -o '[0-9]* file' | grep -o '[0-9]*')"
        insertions="$(echo "$changed" | grep -o '[0-9]* insertion' | grep -o '[0-9]*')"
        deletions="$(echo "$changed" | grep -o '[0-9]* deletion' | grep -o '[0-9]*')"
        changed=" | ${files}f"
        [ -n "$insertions" ] && changed="$changed +$insertions"
        [ -n "$deletions" ] && changed="$changed -$deletions"
    fi
    lf -remote "send $id set user_status \"git: $remote | $branch | ${commits}c ${authors}a | $last$changed\""
else
    lf -remote "send $id set user_status \"\""
fi
