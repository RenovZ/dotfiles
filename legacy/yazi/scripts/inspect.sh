#!/usr/bin/env bash
set -euo pipefail
f="$1"
printf '\033[1;36m╭── Inspect ──────────────────────╮\033[0m\n'
printf '\033[1;36m│\033[0m \033[1;33m%s\033[0m\n' "$(basename "$f")"
printf '\033[1;36m╰──────────────────────────────────╯\033[0m\n\n'
printf '\033[1;32m Path:\033[0m       %s\n' "$f"
if [ -L "$f" ]; then
  printf '\033[1;32m Symlink:\033[0m    → %s\n' "$(readlink "$f")"
fi
printf '\033[1;32m Type:\033[0m       %s\n' "$(file -b "$f")"
printf '\033[1;32m MIME:\033[0m       %s\n' "$(file -bI "$f" 2>/dev/null || file -bi "$f")"
printf '\033[1;32m Size:\033[0m       %s bytes (%s)\n' "$(wc -c < "$f" | tr -d ' ')" "$(ls -lh "$f" | awk '{print $5}')"
printf '\033[1;32m Perms:\033[0m      %s\n' "$(ls -ld "$f" | awk '{print $1}')"
printf '\033[1;32m Owner:\033[0m      %s:%s\n' "$(ls -ld "$f" | awk '{print $3}')" "$(ls -ld "$f" | awk '{print $4}')"
printf '\033[1;32m Modified:\033[0m   %s\n' "$(date -r "$f" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || stat -c '%y' "$f" 2>/dev/null)"
if command -v md5 >/dev/null 2>&1; then
  printf '\033[1;32m MD5:\033[0m        %s\n' "$(md5 -q "$f" 2>/dev/null)"
fi
echo
