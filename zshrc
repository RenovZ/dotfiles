#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git zsh-shift-select)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -d $(brew --prefix)/share/zsh-autosuggestions ]] || source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -d $(brew --prefix)/share/zsh-syntax-highlighting ]] || source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(wezterm shell-completion --shell zsh)
eval "$(zoxide init zsh)"
[[ ! `type helm > /dev/null 2>&1` ]] || source <(helm completion zsh)
[[ ! `type orbctl &> /dev/null` ]] || source <(orbctl completion zsh)

if [[ -d $(brew --prefix)/share/zsh-completions ]]; then
	type kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
  autoload -Uz compinit
	compinit
fi

export FORGIT_FZF_DEFAULT_OPTS="--cycle --height='100%' --ansi --bind='?:toggle-preview' --bind='alt-w:toggle-preview-wrap' --preview-window='right:60%' +1"
[ -f $(brew --prefix)/share/forgit/forgit.plugin.zsh ] && source $(brew --prefix)/share/forgit/forgit.plugin.zsh
# export PATH=$FORGIT_INSTALL_DIR/bin:$PATH

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#[[ ! -f ~/.asdf/asdf.sh ]] || source ~/.asdf/asdf.sh
eval "$(fzf --zsh)"
. ~/.config/dotfiles/profile.sh
source ~/.config/dotfiles/fzf-git.sh
source ~/.config/dotfiles/bind.sh

# To customize prompt, run `p10k configure` or edit ~/.config/dotfiles/p10k.zsh.
[[ ! -f ~/.config/dotfiles/p10k.zsh ]] || source ~/.config/dotfiles/p10k.zsh
