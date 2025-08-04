bass source ~/.config/dotfiles/profile.sh
# bass -d "source ~/.config/dotfiles/profile.sh" > profile.fish
# source ~/.config/dotfiles/profile.fish.sh

source ~/.config/fish/asdf.fish
source ~/.local/bin/env.fish

wezterm shell-completion --shell fish | source
zoxide init fish | source
fzf --fish | source

not command -v helm >/dev/null || helm completion fish | source
not command -v kubectl >/dev/null || kubectl completion fish | source
not command -v kubebuilder >/dev/null || kubebuilder completion fish | source
command -v orbctl >/dev/null && orbctl completion fish | source

#mcfly init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Added by Radicle.
export PATH="$PATH:/Users/zzq/.radicle/bin"

# pnpm
set -gx PNPM_HOME "/Users/cgxxv/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
