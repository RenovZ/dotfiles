CUSTOM_SYS_SHELL_HOME=~/.config/sys-config/shell
for file in $CUSTOM_SYS_SHELL_HOME/*; do
	. "$file"
done

. ~/.config/sys-config/rust
. ~/.config/sys-config/golang
. ~/.config/sys-config/export
. ~/.config/sys-config/alias

if [ -f ~/.devprofile ]; then
	. ~/.devprofile
fi

if [ -f ~/.bashrc_docker ]; then
	. ~/.bashrc_docker
fi

# zstyle ':completion:*:*:docker:*' option-stacking yes
# zstyle ':completion:*:*:docker-*:*' option-stacking yes

# # This speeds up pasting w/ autosuggest
# # https://github.com/zsh-users/zsh-autosuggestions/issues/238
# pasteinit() {
#   OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
#   zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
# }

# pastefinish() {
#   zle -N self-insert $OLD_SELF_INSERT
# }
# zstyle :bracketed-paste-magic paste-init pasteinit
# zstyle :bracketed-paste-magic paste-finish pastefinish
. "/Users/zzq/.acme.sh/acme.sh.env"
. "$HOME/.cargo/env"
