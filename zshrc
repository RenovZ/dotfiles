#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

. ~/.profile
. ~/.asdf/asdf.sh
. ~/Store/fzf/shell/key-bindings.zsh

eval "$(zoxide init zsh)"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
