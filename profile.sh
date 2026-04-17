source ~/.config/dotfiles/export.sh
source ~/.config/dotfiles/homebrew.sh

source ~/.config/dotfiles/rust.sh
source ~/.config/dotfiles/golang.sh
source ~/.config/dotfiles/alias.sh
source ~/.config/dotfiles/bat.sh

ulimit -n 65535

[[ ! -f ~/.devprofile ]] || source ~/.devprofile
[[ ! -f ~/.bashrc_docker ]] || source ~/.bashrc_docker
[[ ! -f ~/.acme.sh/acme.sh.env ]] || source ~/.acme.sh/acme.sh.env
type luarocks &> /dev/null && eval "$(luarocks path --bin)"
