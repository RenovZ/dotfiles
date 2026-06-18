#!/bin/bash
if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "Not a git repository."
    exit 0
fi

{
    printf '\033[1;36m╭──────────────────────────────────────────────╮\033[0m\n'
    printf '\033[1;36m│\033[0m             \033[1;33mGit Repository Info\033[0m              \033[1;36m│\033[0m\n'
    printf '\033[1;36m╰──────────────────────────────────────────────╯\033[0m\n'
    echo

    if git remote >/dev/null 2>&1; then
        while IFS= read -r name; do
            url="$(git remote get-url "$name" 2>/dev/null)"
            printf "\033[1;32m Remote:\033[0m      \033[2m%s\033[0m  %s\n" "$name" "$url"
        done <<EOF
$(git remote 2>/dev/null)
EOF
    else
        printf "\033[1;32m Remote:\033[0m      \033[2m(none)\033[0m\n"
    fi

    branch="$(git branch --show-current)"
    if [ -z "$branch" ]; then
        branch="$(git rev-parse --short HEAD) (detached)"
    fi
    printf "\033[1;32m Branch:\033[0m      %s\n" "$branch"

    if git rev-parse @{upstream} >/dev/null 2>&1; then
        ahead="$(git rev-list @{upstream}..HEAD --count)"
        behind="$(git rev-list HEAD..@{upstream} --count)"
        printf "\033[1;32m Tracking:\033[0m    "
        [ "$ahead" -gt 0 ] && printf "↑%s " "$ahead"
        [ "$behind" -gt 0 ] && printf "↓%s" "$behind"
        [ "$ahead" -eq 0 ] && [ "$behind" -eq 0 ] && printf "up to date"
        echo
    fi

    total_commits="$(git rev-list --count HEAD 2>/dev/null)"
    printf "\033[1;32m Commits:\033[0m     %s\n" "$total_commits"

    authors="$(git log --format='%aN' 2>/dev/null | sort -u | wc -l | tr -d ' ')"
    printf "\033[1;32m Authors:\033[0m     %s\n" "$authors"

    tag_count="$(git tag | wc -l | tr -d ' ')"
    [ "$tag_count" -gt 0 ] && printf "\033[1;32m Tags:\033[0m        %s\n" "$tag_count"

    first_commit="$(git log --reverse --format='%ad (%h)' --date=short 2>/dev/null | head -1)"
    printf "\033[1;32m First:\033[0m       %s\n" "$first_commit"

    echo
    printf '\033[1;36m── Latest Commit ──\033[0m\n'

    latest_full="$(git log -1 --format='%H' 2>/dev/null)"
    latest_short="$(git log -1 --format='%h' 2>/dev/null)"
    latest_subject="$(git log -1 --format='%s' 2>/dev/null)"
    latest_body="$(git log -1 --format='%b' 2>/dev/null)"
    latest_author_name="$(git log -1 --format='%aN' 2>/dev/null)"
    latest_author_email="$(git log -1 --format='%ae' 2>/dev/null)"
    latest_author_date="$(git log -1 --format='%ai' 2>/dev/null)"
    latest_committer_name="$(git log -1 --format='%cN' 2>/dev/null)"
    latest_committer_email="$(git log -1 --format='%ce' 2>/dev/null)"
    latest_committer_date="$(git log -1 --format='%ci' 2>/dev/null)"

    printf "\033[1;32m Hash:\033[0m        %s\n" "$latest_full"
    printf "              \033[2m(%s)\033[0m\n" "$latest_short"
    echo

    printf "\033[1;32m Subject:\033[0m     %s\n" "$latest_subject"
    if [ -n "$latest_body" ]; then
        echo "$latest_body" | while IFS= read -r line; do
            printf "              %s\n" "$line"
        done
    fi
    echo

    printf "\033[1;32m Author:\033[0m      %s \033[2m<%s>\033[0m\n" "$latest_author_name" "$latest_author_email"
    printf "              %s\n" "$latest_author_date"

    if [ "$latest_author_email" != "$latest_committer_email" ]; then
        echo
        printf "\033[1;32m Committer:\033[0m   %s \033[2m<%s>\033[0m\n" "$latest_committer_name" "$latest_committer_email"
        printf "              %s\n" "$latest_committer_date"
    fi

    echo
    printf "\033[1;32m Changes:\033[0m\n"
    git -c color.ui=always diff-tree --no-commit-id --stat -r "$latest_full" 2>/dev/null | while IFS= read -r line; do
        printf "             %s\n" "$line"
    done

    tags_on_commit="$(git tag --points-at "$latest_full" 2>/dev/null)"
    if [ -n "$tags_on_commit" ]; then
        echo
        printf "\033[1;32m Tags:\033[0m"
        echo "$tags_on_commit" | while IFS= read -r tag; do
            printf "        %s\n" "$tag"
        done
    fi

    stash_count="$(git stash list 2>/dev/null | wc -l | tr -d ' ')"
    [ "$stash_count" -gt 0 ] && printf "\033[1;32m Stashes:\033[0m   %s\n" "$stash_count"

    echo
    printf '\033[1;36m── Status ──\033[0m\n'
    git -c color.status=always status -s

    echo
    printf '\033[1;36m── Top Contributors ──\033[0m\n'
    git shortlog -sne 2>/dev/null | sort -rn | head -10
} | less -R
