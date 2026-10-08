#!/bin/bash
# Confirm and move files to the XDG trash via `gio` (lf's `delete` command).
#
# lf runs this as a shell-pipe ('%') command (see lfrc):
#   - stdin is the statline input (line buffered), so `read` gets the answer
#   - stdout/stderr are shown in the statline, keeping the prompt inside lf
#
# The selection is taken from lf's exported $fx variable (newline-separated
# raw paths) instead of "$@", so filenames containing spaces survive.
# Positional arguments override $fx when the script is run manually.

if ! command -v gio >/dev/null 2>&1; then
    printf 'delete: gio not found (install libglib2.0-bin)\n' >&2
    exit 1
fi

# lf exports absolute paths in $fx; display them relative to the current
# directory (e.g. "test.2" instead of "~/dir/test.2") to keep the prompt
# short. Paths not under the current directory keep their absolute form so
# they remain unambiguous.
display_name() {
    local dir=${PWD%/}
    printf '%s' "${1#"$dir"/}"
}

files=("$@")
if [ "${#files[@]}" -eq 0 ]; then
    while IFS= read -r path; do
        [ -n "$path" ] && files+=("$path")
    done <<< "${fx:-}"
fi

count=${#files[@]}
if [ "$count" -eq 0 ]; then
    printf 'delete: nothing selected\n' >&2
    exit 1
fi

first=$(display_name "${files[0]}")
if [ "$count" -eq 1 ]; then
    printf "delete '%s'? [y/N] " "$first" >&2
else
    printf "delete '%s' and %d more? [y/N] " "$first" "$((count - 1))" >&2
fi

read -r answer || exit 1

case "$answer" in
    [yY] | [yY][eE][sS]) ;;
    *)
        printf 'cancelled\n' >&2
        exit 0
        ;;
esac

if gio trash -- "${files[@]}"; then
    printf 'deleted\n' >&2
else
    exit 1
fi
