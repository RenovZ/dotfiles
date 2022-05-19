bass source ~/.config/sys-config/profile

# pyenv (asdf still uses pyenv under the hood)
set -gx PYTHON_BUILD_ARIA2_OPTS "-x 10 -k 1M" # Use aria2c when downloading
source ~/.asdf/asdf.fish

thefuck --alias | source

luarocks path --bin | source

zoxide init fish | source
mcfly init fish | source

set -Ux VISUAL vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
