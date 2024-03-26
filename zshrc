#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

. ~/.asdf/asdf.sh
. ~/.config/sys-config/profile

eval "$(fzf --zsh)"

# HOMEBREW_DIR=/opt/homebrew
# export PATH=$HOMEBREW_DIR/bin:$PATH

export FORGIT_FZF_DEFAULT_OPTS="--cycle --height='100%' --ansi --bind='?:toggle-preview' --bind='alt-w:toggle-preview-wrap' --preview-window='right:60%' +1"
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh
# export PATH=$FORGIT_INSTALL_DIR/bin:$PATH

eval "$(zoxide init zsh)"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
