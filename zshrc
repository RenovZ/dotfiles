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

[[ ! -f $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme ]] || source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -d $(brew --prefix)/share/zsh-autosuggestions ]] || source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -d $(brew --prefix)/share/zsh-syntax-highlighting ]] || source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ ! `type wezterm &> /dev/null` ]] || source <(wezterm shell-completion --shell zsh)
[[ ! `type helm &> /dev/null` ]] || source <(helm completion zsh)
[[ ! `type orbctl &> /dev/null` ]] || source <(orbctl completion zsh)

type zoxide &> /dev/null && eval "$(zoxide init zsh)"
# type direnv &> /dev/null && eval "$(direnv hook zsh)"

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(fzf --zsh)"

if [[ -d $(brew --prefix)/share/zsh-completions ]]; then
	type kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
	type kubebuilder >/dev/null 2>&1 && source <(kubebuilder completion zsh)
	type asdf >/dev/null 2>&1 && source <(asdf completion zsh)
	autoload -Uz compinit
	compinit
fi
