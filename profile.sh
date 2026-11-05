[[ ! -f ~/.profile.sh ]] || source ~/.profile.sh

source ~/.config/dotfiles/export.sh
# source ~/.config/dotfiles/homebrew.sh

source ~/.config/dotfiles/golang.sh
source ~/.config/dotfiles/alias.sh
source ~/.config/dotfiles/bat.sh

# rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

ulimit -n 65535

# devprofile
[[ ! -f ~/.devprofile ]] || source ~/.devprofile

# docker
[[ ! -f ~/.bashrc_docker ]] || source ~/.bashrc_docker

# # luarocks
# # [[ ! -f ~/.acme.sh/acme.sh.env ]] || source ~/.acme.sh/acme.sh.env
# if command -v luarocks >/dev/null 2>&1; then
#   eval "$(luarocks path --bin)"
# fi
