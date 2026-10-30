#!/bin/bash
# lf on-load hook: show a per-file git status marker in the info column.
#
# lf calls on-load with the absolute paths of a freshly loaded directory.
# Inside a work tree one `git status` runs for the whole repository (not one
# per file); the porcelain XY code is mapped onto each listed path and pushed
# back as the `custom` info field via addcustominfo. Directories containing
# changes get a `●` so navigation up the tree still reveals where they are.
#
# Outside any work tree (e.g. the directory that contains your repositories)
# each child directory that is a git repository root is checked and marked
# with `●` when its working tree is dirty. Results are cached for a few
# seconds (see `repo_dirty`) so walking through such a directory does not
# re-run git on every repository for each keypress.
#
# Enable in lfrc:
#   set info custom
#   cmd on-load &{{ ~/.config/lf/git_status_info.sh "$@" }}
#
# Clean files are skipped: every load rebuilds the directory entries, so
# stale markers disappear on reload without explicit clearing.

[ "$#" -gt 0 ] || exit 0

dir=$(dirname -- "$1")
cd -- "$dir" 2>/dev/null || exit 0

cmds=()
bytes=0

# The remote protocol is line based with a 64KB limit, so flush in chunks.
flush() {
    [ ${#cmds[@]} -eq 0 ] && return 0
    local joined
    printf -v joined '%s;' "${cmds[@]}"
    lf -remote "send $id :$joined" 2>/dev/null
    cmds=()
    bytes=0
}

# Queue one addcustominfo command for an absolute path.
add_info() {
    local path=$1 info=$2 esc cmd
    # Escape for lf's double-quoted command string.
    esc=${path//\\/\\\\}
    esc=${esc//\"/\\\"}

    cmd="addcustominfo \"$esc\" \"$info\""
    cmds+=("$cmd")
    ((bytes += ${#cmd}))
    if ((bytes > 49152)); then
        flush
    fi
}

# Translate a porcelain XY pair into a colored marker. Colors follow git's
# convention: green = staged, yellow = unstaged/mixed, red = deleted or
# conflict, magenta = rename/copy, dim = untracked.
marker() {
    local xy=$1 x=${1:0:1} y=${1:1:1} color
    if [ "$xy" = "??" ]; then
        printf '\\033[2;37m??\\033[0m'
        return
    fi
    case $xy in
        *U*)     color='1;31' ;;
        *D*)     color=31 ;;
        *R*|*C*) color=35 ;;
        *)
            if [ "$x" != " " ] && [ "$y" != " " ]; then
                color=33 # staged + unstaged changes
            elif [ "$x" != " " ]; then
                color=32 # staged only
            else
                color=33 # unstaged only
            fi
            ;;
    esac
    printf '\\033[%sm%s\\033[0m' "$color" "${xy// /}"
}

if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    [ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" = "false" ] || exit 0

    # Paths in `git status --porcelain` are relative to the repo root, so match
    # them against this directory's prefix instead of comparing absolute paths
    # (which breaks when a repo is reached through a symlink).
    prefix=$(git rev-parse --show-prefix 2>/dev/null) || exit 0

    declare -A status_of=()
    declare -A dirty_dirs=()

    while IFS= read -r -d '' entry; do
        xy=${entry:0:2}
        rel=${entry:3}
        # -z rename/copy records are followed by the original path as a bare record
        if [[ ${xy:0:1} == [RC] ]]; then
            IFS= read -r -d '' _orig
        fi
        rel=${rel%/}

        # Only paths inside this pane's subtree matter for its listing, so skip
        # the rest of a large repository's status early.
        [[ $rel == "$prefix"* ]] || continue

        status_of[$rel]=$xy

        # Mark every ancestor directory so a collapsed directory still reveals
        # that something below it changed. Parameter expansion instead of
        # dirname(1): this runs for every changed file.
        d=${rel%/*}
        [ "$d" = "$rel" ] && d="."
        while :; do
            dirty_dirs[$d]=1
            [ "$d" = "." ] && break
            case $d in
                */*) d=${d%/*} ;;
                *) d="." ;;
            esac
        done
    done < <(git status --porcelain -z --untracked-files=normal 2>/dev/null)

    for f in "$@"; do
        case $f in
            */.git|*/.git/*) continue ;;
            *$'\n'*) continue ;; # cannot be sent through the line-based protocol
        esac

        key=$prefix${f##*/}
        xy=${status_of[$key]:-}
        if [ -n "$xy" ]; then
            add_info "$f" "$(marker "$xy")"
        elif [ -n "${dirty_dirs[$key]:-}" ]; then
            add_info "$f" '\033[33m●\033[0m'
        fi
    done
else
    # Not inside a work tree: mark child directories that are dirty repos.
    now=$(printf '%(%s)T' -1)
    cache_dir="${XDG_RUNTIME_DIR:-/tmp}/lf-git-status-$UID"
    mkdir -p -m 700 "$cache_dir" 2>/dev/null || cache_dir=""

    # Print 1 when the repository has staged, unstaged or untracked changes.
    # A short-lived cache keyed by repo path keeps repeated on-load calls
    # (parent and current pane during one navigation) from re-running git.
    repo_dirty() {
        local repo=$1 key cache ts cached dirty=0
        if [ -n "$cache_dir" ]; then
            key=$(printf '%s' "$repo" | cksum)
            key=${key%% *}
            cache=$cache_dir/$key
            if [ -r "$cache" ]; then
                read -r ts cached <"$cache"
                if [ -n "$ts" ] && ((now - ts >= 0 && now - ts < 10)); then
                    printf '%s' "$cached"
                    return
                fi
            fi
        fi
        # `head -c 1` stops at the first status byte, so huge untracked trees
        # are not read to the end just to know the repo is dirty.
        if [ -n "$(git -C "$repo" status --porcelain -z --untracked-files=normal 2>/dev/null | head -c 1)" ]; then
            dirty=1
        fi
        [ -n "${cache:-}" ] && printf '%s %s\n' "$now" "$dirty" >"$cache" 2>/dev/null
        printf '%s' "$dirty"
    }

    for f in "$@"; do
        case $f in
            */.git|*/.git/*) continue ;;
            *$'\n'*) continue ;;
        esac
        [ -d "$f" ] && [ -e "$f/.git" ] || continue
        [ "$(repo_dirty "$f")" = "1" ] || continue
        add_info "$f" '\033[33m●\033[0m'
    done
fi

flush

exit 0
