# Bootstrap: ensure /opt/homebrew/bin is in PATH before bass runs,
# so that asdf shims (used by bass via python3) can find the `asdf` binary.
# fish_add_path --prepend /opt/homebrew/bin /opt/homebrew/sbin

bass source ~/.config/dotfiles/profile.sh
# bass -d "source ~/.config/dotfiles/profile.sh" > profile.fish
# source ~/.config/dotfiles/profile.fish.sh

# source ~/.config/fish/asdf.fish
source ~/.config/dotfiles/vendor/fzf-git.sh/fzf-git.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.profile.fish 2>/dev/null || :

# Deduplicate PATH while preserving order; profile scripts append the same
# directories on every nested shell.
set -gx PATH (printf '%s\n' $PATH | awk '!seen[$0]++')
