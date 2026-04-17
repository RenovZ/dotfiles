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
