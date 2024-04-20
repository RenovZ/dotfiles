#source ~/.asdf/asdf.fish
bass source ~/.config/dotfiles/profile.sh
# bass -d "source ~/.config/dotfiles/profile.sh" > profile.fish
# source ~/.config/dotfiles/profile.fish.sh

wezterm shell-completion --shell fish | source

# pyenv (asdf still uses pyenv under the hood)
# set -gx PYTHON_BUILD_ARIA2_OPTS "-x 10 -k 1M" # Use aria2c when downloading

zoxide init fish | source
fzf --fish | source

not command -v helm > /dev/null || helm completion fish | source
not command -v kubectl > /dev/null || kubectl completion fish | source
command -v orbctl > /dev/null && orbctl completion fish | source

# PatrickF1/fzf.fish instead
#mcfly init fish | source

if status is-interactive
  # Commands to run in interactive sessions can go here
end
