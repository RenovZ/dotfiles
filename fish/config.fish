# . ~/.config/sys-config/rustrc
# . ~/.config/sys-config/golangrc
# . ~/.config/sys-config/exports
# . ~/.config/sys-config/aliases
bass source ~/.config/sys-config/profile

zoxide init fish | source
mcfly init fish | source

set -U fish_user_paths $fish_user_paths "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"
set -Ux VISUAL vim

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
