#!/usr/bin/env bash
set -e -u -o pipefail

THEMES_DIR="$HOME/.config/helix/themes"
THEME_LINK="$THEMES_DIR/adaptive.toml"

if [[ "$1" == "light" ]]; then
  ln -sf "$THEMES_DIR/light.toml" "$THEME_LINK"
else
  ln -sf "$THEMES_DIR/dark.toml" "$THEME_LINK"
fi

pkill -USR1 hx || true
