bass source ~/.config/sys-config/profile

luarocks path --bin | source
thefuck --alias | source

zoxide init fish | source
mcfly init fish | source

# pyenv (asdf still uses pyenv under the hood)
set -gx PYTHON_BUILD_ARIA2_OPTS "-x 10 -k 1M" # Use aria2c when downloading
source ~/.asdf/asdf.fish

set -U fish_user_paths $fish_user_paths "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"
set -Ux VISUAL vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
