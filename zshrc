#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
git
zsh-shift-select
docker-compose
rsync
fzf
)

[[ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]] || source ~/.oh-my-zsh/oh-my-zsh.sh

source ~/.config/dotfiles/profile.sh
source ~/.config/dotfiles/vendor/fzf-git.sh/fzf-git.sh
source ~/.config/dotfiles/bind.sh
# source ~/.local/bin/env

# Homebrew-installed zsh plugins, only when brew is available.
_brew_prefix=
if (( $+commands[brew] )); then
  _brew_prefix=$(brew --prefix)
  [[ ! -f $_brew_prefix/share/powerlevel10k/powerlevel10k.zsh-theme ]] || source $_brew_prefix/share/powerlevel10k/powerlevel10k.zsh-theme
  [[ ! -f $_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source $_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/dotfiles/p10k.zsh ]] || source ~/.config/dotfiles/p10k.zsh

[[ ! -f ~/.profile.zsh ]] || source ~/.profile.zsh

# zsh-syntax-highlighting must be sourced last, after all ZLE widgets are defined.
if [[ -f $_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source $_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
unset _brew_prefix
