source ~/.config/dotfiles/export.sh
source ~/.config/dotfiles/homebrew.sh

source ~/.config/dotfiles/rust.sh
source ~/.config/dotfiles/golang.sh
source ~/.config/dotfiles/alias.sh
source ~/.config/dotfiles/bat.sh

ulimit -n 65535

# devprofile
# [[ ! -f ~/.devprofile ]] || source ~/.devprofile
if [[ -f ~/.devprofile ]]; then
  source ~/.devprofile
fi

# docker
# [[ ! -f ~/.bashrc_docker ]] || source ~/.bashrc_docker
if [[ -f ~/.bashrc_docker ]]; then
  source ~/.bashrc_docker
fi

# luarocks
# [[ ! -f ~/.acme.sh/acme.sh.env ]] || source ~/.acme.sh/acme.sh.env
if command -v luarocks >/dev/null 2>&1; then
  eval "$(luarocks path --bin)"
fi
