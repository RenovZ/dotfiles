#CUSTOM_SYS_SHELL_HOME=~/.config/sys-config/shell
#for file in $CUSTOM_SYS_SHELL_HOME/*; do
#	. "$file"
#done

. ~/.config/sys-config/rust
. ~/.config/sys-config/golang
. ~/.config/sys-config/export
. ~/.config/sys-config/alias
. ~/.config/sys-config/tinygo

if [ -f ~/.devprofile ]; then
	. ~/.devprofile
fi

if [ -f ~/.bashrc_docker ]; then
	. ~/.bashrc_docker
fi

. "/Users/zzq/.acme.sh/acme.sh.env"
. "$HOME/.cargo/env"

# asdf
# . "$HOME/.asdf/asdf.sh"

eval "$(luarocks path --bin)"

# emsdk
export EMSDK_QUIET=1
. "$HOME/.asdf/installs/emsdk/3.1.30/emsdk_env.sh"

# Wasmer
export WASMER_DIR="/Users/zzq/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
