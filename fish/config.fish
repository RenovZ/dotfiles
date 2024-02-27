source ~/.asdf/asdf.fish
bass source ~/.config/sys-config/profile
# bass -d "source ~/.config/sys-config/profile" > profile.fish
# source ~/.config/sys-config/profile.fish

set -gx PATH "$HOME/.cargo/bin" $PATH

# pyenv (asdf still uses pyenv under the hood)
set -gx PYTHON_BUILD_ARIA2_OPTS "-x 10 -k 1M" # Use aria2c when downloading

#thefuck --alias | source

zoxide init fish | source

# PatrickF1/fzf.fish instead
#mcfly init fish | source
#source /opt/local/share/fzf/shell/key-bindings.fish
#function fish_user_key_bindings
#    fzf_key_bindings
#end

# really slow
# kubectl completion fish | source
# minikube completion fish | source

set -Ux VISUAL nvim
set SHELL /opt/local/bin/fish

# set proxy_host 127.0.0.1:7890
# set proxy_auth false

if status is-interactive
  # Commands to run in interactive sessions can go here
end
test -e /Users/zzq/.iterm2_shell_integration.fish ; and source /Users/zzq/.iterm2_shell_integration.fish ; or true
