#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

. ~/.config/sys-config/profile
. ~/.asdf/asdf.sh
. ~/Store/fzf/shell/key-bindings.zsh

export FORGIT_INSTALL_DIR=~/Store/forgit
. "${FORGIT_INSTALL_DIR}/forgit.plugin.zsh"
export FORGIT_FZF_DEFAULT_OPTS="--cycle --height='100%' --ansi --bind='?:toggle-preview' --bind='alt-w:toggle-preview-wrap' --preview-window='right:60%' +1"
export PATH=$FORGIT_INSTALL_DIR/bin:$PATH

eval "$(zoxide init zsh)"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
