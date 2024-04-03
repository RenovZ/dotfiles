#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

. ~/.asdf/asdf.sh
. ~/.config/sys-config/profile.sh

source <(wezterm shell-completion --shell zsh)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-completions
source <(kubectl completion zsh)
autoload -Uz compinit
compinit

# HOMEBREW_DIR=/opt/homebrew
# export PATH=$HOMEBREW_DIR/bin:$PATH

export FORGIT_FZF_DEFAULT_OPTS="--cycle --height='100%' --ansi --bind='?:toggle-preview' --bind='alt-w:toggle-preview-wrap' --preview-window='right:60%' +1"
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh
# export PATH=$FORGIT_INSTALL_DIR/bin:$PATH

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
