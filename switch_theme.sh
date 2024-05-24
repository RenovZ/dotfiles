#!/usr/bin/env bash

set -e -u -o pipefail

THEME_LIGHT="github_light"
THEME_DARK="github_dark"
THEME_FILEPATH="${HOME}/.config/helix/themes/github_transparent.toml"

if [[ $# -eq 0 ]]; then
  echo "Error: Missing theme argument." >&2
  exit 1
fi

if [[ $1 == "light" ]]; then
  sed -i '' -E "s/^inherits = \"$THEME_DARK\"$/inherits = \"$THEME_LIGHT\"/" "$THEME_FILEPATH"
elif [[ $1 == "dark" ]]; then
  sed -i '' -E "s/^inherits = \"$THEME_LIGHT\"$/inherits = \"$THEME_DARK\"/" "$THEME_FILEPATH"
else
  echo "Error: Invalid theme '$1'. Expected 'light' or 'dark'." >&2
  exit 1
fi

pkill -USR1 hx || true
