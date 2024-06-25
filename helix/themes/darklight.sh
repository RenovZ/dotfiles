#!/bin/bash

# https://github.com/qdentity/darklight

if [[ "$(darklight)" == *"Dark"* ]]; then
	mode="dark"
else
	mode="light"
fi

THEME_TARGET="${HOME}/.config/helix/themes/${mode}.toml"
THEME_LINK="${HOME}/.config/helix/themes/adaptive.toml"

ln -sf $THEME_TARGET $THEME_LINK
