#!/usr/bin/env bash
# Launch lf with a fresh terminal-background detection.
#
# lf's previewer cannot query the terminal itself: lf (tcell) keeps a read
# pending on /dev/tty and would steal the OSC 11 reply, and switching the tty
# to raw mode there would clobber lf's terminal state. Detecting here, before
# lf starts, keeps light/dark previews correct even when the terminal theme
# was toggled after the shell was started.
#
# Wired up in alias.sh as:
#     alias lf="~/.config/dotfiles/lf/lf.sh"
# It can also be symlinked into PATH as `lf`; the lookup below skips it.

set -u

if mode=$(~/.config/dotfiles/theme-detect); then
	export DOTFILES_APPEARANCE=$mode
fi

# Find the real lf binary, skipping this launcher if it is on PATH as `lf`
# (for example a ~/.local/bin/lf symlink pointing here).
old_ifs=$IFS
IFS=:
for dir in $PATH; do
	[ -n "$dir" ] || dir=.
	cand=$dir/lf
	[ -x "$cand" ] || continue
	[ "$cand" -ef "$0" ] && continue
	IFS=$old_ifs
	exec "$cand" "$@"
done
IFS=$old_ifs

echo "lf: not found in PATH (only the launcher itself)" >&2
exit 127
