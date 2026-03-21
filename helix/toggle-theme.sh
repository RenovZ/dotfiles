#!/usr/bin/env bash
set -e -u -o pipefail

HELIX_CONFIG="$HOME/.config/helix/config.toml"
DARK="dark"
LIGHT="light"

if [[ "$1" == "light" ]]; then
  sed -i '' -E "s/^theme.*/theme = \"$LIGHT\"/" "$HELIX_CONFIG"
else
  sed -i '' -E "s/^theme.*/theme = \"$DARK\"/" "$HELIX_CONFIG"
fi

pkill -USR1 hx || true
