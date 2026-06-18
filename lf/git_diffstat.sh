#!/bin/bash
if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "Not a git repository."
    exit 0
fi
{
    staged="$(git -c color.ui=always diff --cached --stat 2>/dev/null)"
    if [ -n "$staged" ]; then
        echo "=== Staged changes ==="
        echo "$staged"
        echo
    fi
    unstaged="$(git -c color.ui=always diff --stat 2>/dev/null)"
    if [ -n "$unstaged" ]; then
        echo "=== Unstaged changes ==="
        echo "$unstaged"
        echo
    fi
    untracked="$(git ls-files --others --exclude-standard 2>/dev/null)"
    if [ -n "$untracked" ]; then
        echo "=== Untracked files ==="
        echo "$untracked"
    fi
    [ -z "$staged" ] && [ -z "$unstaged" ] && [ -z "$untracked" ] && echo "Working tree clean."
} | less -R
