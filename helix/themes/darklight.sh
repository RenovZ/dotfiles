#!/bin/bash

# https://github.com/qdentity/darklight

export PATH=${HOME}/.cargo/bin:$PATH

if [[ "$(darklight)" == *"Dark"* ]]; then
	mode="dark"
else
	mode="light"
fi

THEME_TARGET="${HOME}/.config/helix/themes/${mode}.toml"
THEME_LINK="${HOME}/.config/helix/themes/adaptive.toml"

target_file=$(readlink -f $THEME_LINK)
file_name=$(basename $target_file)
file_name_no_ext="${file_name%.*}"

if [[ "${file_name_no_ext}" != *"${mode}"* ]]; then
	ln -sf $THEME_TARGET $THEME_LINK
fi

# echo "mode:" $mode
# echo "target_file:" $target_file
# echo "file_name:" $file_name
# echo "file_name_no_ext:" $file_name_no_ext
#
# ln -sf $THEME_TARGET $THEME_LINK
