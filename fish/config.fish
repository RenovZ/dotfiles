# Bootstrap: ensure /opt/homebrew/bin is in PATH before bass runs,
# so that asdf shims (used by bass via python3) can find the `asdf` binary.
# fish_add_path --prepend /opt/homebrew/bin /opt/homebrew/sbin

bass source ~/.config/dotfiles/profile.sh
# bass -d "source ~/.config/dotfiles/profile.sh" > profile.fish
# source ~/.config/dotfiles/profile.fish.sh

source ~/.config/fish/asdf.fish
source ~/.config/dotfiles/vendor/fzf-git.sh/fzf-git.fish

not command -v wezterm >/dev/null || wezterm shell-completion --shell fish | source
zoxide init fish | source
fzf --fish | source

# not command -v direnv >/dev/null || direnv allow
not command -v helm >/dev/null || helm completion fish | source
not command -v kubectl >/dev/null || kubectl completion fish | source
not command -v kubebuilder >/dev/null || kubebuilder completion fish | source
not command -v orbctl >/dev/null || orbctl completion fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
