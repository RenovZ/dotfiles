source ~/.config/dotfiles/export.sh
source ~/.config/dotfiles/homebrew.sh

source ~/.config/dotfiles/rust.sh
source ~/.config/dotfiles/golang.sh
source ~/.config/dotfiles/alias.sh
source ~/.config/dotfiles/tinygo.sh
source ~/.config/dotfiles/bat.sh

ulimit -n 65535

if [ -f ~/.devprofile ]; then
	source ~/.devprofile
fi

if [ -f ~/.bashrc_docker ]; then
	source ~/.bashrc_docker
fi

[[ ! -f ~/.acme.sh/acme.sh.env ]] || source ~/.acme.sh/acme.sh.env

type luarocks >/dev/null 2>&1 && eval "$(luarocks path --bin)"

# Wasmer
export WASMER_DIR=~/.wasmer
# bugfix：can't execute with bass script
# -s 检查文件是否存在且非空
# -f 检查文件是否存在且为普通文件
# 实际情况是使用一行的以下 bash 脚本，bass 解析失败
# [ -s $WASMER_DIR/wasmer.sh ] && source $WASMER_DIR/wasmer.sh
# [ -f $WASMER_DIR/wasmer.sh ] && source $WASMER_DIR/wasmer.sh
if [ -s $WASMER_DIR/wasmer.sh ]; then
	source $WASMER_DIR/wasmer.sh
fi

# emsdk
EMSDK_HOME=~/emsdk
if [ -s $EMSDK_HOME/emsdk_env.sh ]; then
	source $EMSDK_HOME/emsdk_env.sh
fi
