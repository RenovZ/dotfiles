#!/bin/bash

# Point the helix "adaptive" theme symlink at light.toml or dark.toml.
#
# Mode resolution order:
#   1. explicit argument (darklight.applescript passes the macOS appearance)
#   2. $DOTFILES_APPEARANCE (OSC 11 query in ../../theme-detect, shell startup)
#   3. darklight (macOS)
#   4. dark
#
# https://github.com/qdentity/darklight

set -u

mode=
case ${1:-} in
	[Dd]ark) mode=dark ;;
	[Ll]ight) mode=light ;;
esac

if [ -z "$mode" ]; then
	case ${DOTFILES_APPEARANCE:-} in
		dark | light) mode=$DOTFILES_APPEARANCE ;;
	esac
fi

if [ -z "$mode" ]; then
	export PATH=${HOME}/.cargo/bin:$PATH
	case "$(darklight 2>/dev/null)" in
		*[Dd]ark*) mode=dark ;;
		*[Ll]ight*) mode=light ;;
	esac
fi

mode=${mode:-dark}

themes_dir="${HOME}/.config/helix/themes"
target="${themes_dir}/${mode}.toml"
link="${themes_dir}/adaptive.toml"

# readlink without -f so this also works on macOS (BSD readlink)
current=$(basename "$(readlink "$link" 2>/dev/null)")
if [ "${current%.*}" != "$mode" ]; then
	ln -sf "$target" "$link"
fi
