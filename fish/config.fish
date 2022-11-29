bass source ~/.config/sys-config/profile

# pyenv (asdf still uses pyenv under the hood)
set -gx PYTHON_BUILD_ARIA2_OPTS "-x 10 -k 1M" # Use aria2c when downloading
source ~/.asdf/asdf.fish

#thefuck --alias | source
luarocks path --bin | source

zoxide init fish | source

# PatrickF1/fzf.fish instead
#mcfly init fish | source
#source /opt/local/share/fzf/shell/key-bindings.fish
#function fish_user_key_bindings
#    fzf_key_bindings
#end

kubectl completion fish | source
# really slow
#minikube completion fish | source

set -Ux VISUAL vim
set SHELL /opt/local/bin/fish

# set proxy_host 127.0.0.1:7890
# set proxy_auth false

if status is-interactive
    # Commands to run in interactive sessions can go here
end
