#export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/mysql-client/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/mysql-client/include"
#export PKG_CONFIG_PATH=$(find /usr/local/Cellar -name 'pkgconfig' -type d | grep lib/pkgconfig | tr '\n' ':' | sed s/.$//)

#export C_INCLUDE_PATH=/usr/local/opt/openssl/include
#export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

export LC_ALL=en_US.UTF-8
export EDITOR=hx
export VISUAL=hx
export TIG_EDITOR=hx
export GIT_EDITOR=hx
#export READER="zathura"

#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git/"'

export PATH=/opt/local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
export PATH=/opt/local/sbin:/opt/homebrew/sbin:/usr/local/sbin:$PATH

export ANDROID_SDK_ROOT=~/Android
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

export GNU_HOME=/usr/local/opt/make/libexec
export PATH=$GNU_HOME/gnubin:$PATH

# c++ configuration
export VCPKG_ROOT="$HOME/vcpkg"
export PATH=$VCPKG_ROOT:$PATH

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=$HOME/.sdkbox
export PATH=$SDKBOX_HOME/bin:$PATH

export PATH=~/bin:$PATH

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Fix pyenv install python on macos bigsure error
#https://stackoverflow.com/questions/66766531/installation-of-python-3-8-fails-with-pyenv-on-macos
#export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
#export MACOSX_DEPLOYMENT_TARGET=10.15

export SDKROOT=$(xcrun --show-sdk-path)
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# llvm
LLVM_ROOT=$(brew --prefix)/opt/llvm
export PATH=$LLVM_ROOT/bin:$PATH

# emsdk
export EMSDK_QUIET=1
export PATH=$EMSDK_HOME:$EMSDK_HOME/upstream/emscripten:$PATH

# flutter
export PATH=$HOME/fvm/default/bin:$PATH

# sciter-sdk
# export SCITER_SDK_ROOT=~/Store/sciter-sdk/bin.osx/
# export DYLD_LIBRARY_PATH=$SCITER_SDK_ROOT

# homebrew
# export LIBRARY_PATH="/usr/local/lib:/opt/homebrew/lib:$LIBRARY_PATH"
# export C_INCLUDE_PATH="/usr/local/include:/opt/homebrew/include:$C_INCLUDE_PATH"
# export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"

# pnpm
export PNPM_PATH=$HOME/.pnpm
export PATH=$PNPM_PATH:$PATH

# mysql
# export PATH=/usr/local/opt/mysql-client@8.4/bin:$PATH

# Added by Radicle.
export PATH=$HOME.radicle/bin:$PATH
