#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
git
docker-compose
rsync
fzf
)

# Oh My Zsh is optional. ZSH_CUSTOM holds its themes and plugins.
[[ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]] || source ~/.oh-my-zsh/oh-my-zsh.sh
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

source ~/.config/dotfiles/profile.sh
source ~/.config/dotfiles/vendor/fzf-git.sh/fzf-git.sh
source ~/.config/dotfiles/bind.sh

# Powerlevel10k, plus optional plugins that are simply skipped when missing.
[[ ! -f $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme ]] || source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/dotfiles/p10k.zsh ]] || source ~/.config/dotfiles/p10k.zsh

[[ ! -f ~/.profile.zsh ]] || source ~/.profile.zsh

[[ ! -f $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-syntax-highlighting must be sourced last, after all ZLE widgets are defined.
[[ ! -f $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
