#!/bin/bash
clear
branches=$(git branch -rv)
[ -z "$branches" ] && echo "No remote branches." && exit 0
current_branch=$(git branch --show-current)
selected=$(echo "$branches"|fzf --header="$current_branch (current branch)
$(git --no-pager remote -v|awk '{print $1 " " $2}'|sort|uniq)" \
--preview="echo {}|awk '{print \$2}'|xargs git show")
remote=$(echo $selected|awk '{print $1}'|awk -F / '{print $1}')
branch=$(echo $selected|awk '{print $1}'|awk -F / '{print $2}')
if [ -n "$remote" ]; then
    echo "git pull $remote $branch"
    git pull "$remote" "$branch"
fi
