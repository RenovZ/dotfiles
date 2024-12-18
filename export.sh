#export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/mysql-client/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/mysql-client/include"
#export PKG_CONFIG_PATH=$(find /usr/local/Cellar -name 'pkgconfig' -type d | grep lib/pkgconfig | tr '\n' ':' | sed s/.$//)

#export C_INCLUDE_PATH=/usr/local/opt/openssl/include
#export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

export LC_ALL=en_US.UTF-8
# export EDITOR="nvim"
# export EDITOR="hx"
# export TIG_EDITOR="hx"
# export GIT_EDITOR="hx"
#export READER="zathura"

# c++ configuration
export VCPKG_ROOT="$HOME/vcpkg"
export PATH=$VCPKG_ROOT:$PATH

#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git/"'

export ANDROID_SDK_ROOT=~/Android
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

export GNU_HOME=/usr/local/opt/make/libexec
export PATH=$GNU_HOME/gnubin:$PATH

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=$HOME/.sdkbox
export PATH=$SDKBOX_HOME/bin:$PATH

#export DENO_HOME="$HOME/.deno"
#export PATH="$DENO_HOME/bin:$PATH"

export PNPM_HOME=$HOME/.pnpm
export PATH=$PNPM_HOME:$PATH

export PATH=~/bin:$PATH

# emsdk
export EMSDK_QUIET=1
export PATH=$EMSDK_HOME:$EMSDK_HOME/upstream/emscripten:$PATH

# flutter
export PATH=$HOME/fvm/default/bin:$PATH

# sciter-sdk
# export SCITER_SDK_ROOT=~/Store/sciter-sdk/bin.osx/
# export DYLD_LIBRARY_PATH=$SCITER_SDK_ROOT
