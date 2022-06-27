#clashx proxy config
#export https_proxy=http://127.0.0.1:7890
#export http_proxy=http://127.0.0.1:7890
#export all_proxy=socks5://127.0.0.1:7890

#export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/mysql-client/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/mysql-client/include"
#export PKG_CONFIG_PATH=$(find /usr/local/Cellar -name 'pkgconfig' -type d | grep lib/pkgconfig | tr '\n' ':' | sed s/.$//)

#export C_INCLUDE_PATH=/usr/local/opt/openssl/include
#export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

export LC_ALL=en_US.UTF-8
export EDITOR="vim"
# #export VIMEDITOR='vim'
#export READER="zathura"

# c++ configuration
export VCPKG_ROOT="$HOME/vcpkg"

# java configuration
#export JAVA_HOME=/usr/local/Cellar/openjdk@11/11.0.9

#export DISPLAY=:0
#export ICONLOOKUP=1
#export USE_SCOPE=1
#export USE_PISTOL=1
#export TERMINAL='iterm'
#export PREVIEW_MODE=0

#----------- NNN Configuration Start--------------
#export NNN_PREVIEWWIDTH=1000
#export NNN_OPTS="cEnrx"
#export NNN_TRASH=1
export NNN_HELP='pwy paris'
export NNN_FIFO='/tmp/nnn.fifo'
#export NNN_BMS='i:~/.local/pics;w:~/.local/wiki'
export NNN_SEL='/tmp/.sel'
export NNN_PLUG='v:imgview;f:fzcd;t:preview-tui;T:preview-tabbed;p:-!less -iR $nnn*'
#export NNN_USE_EDITOR=1
#export NNN_OPENER=vim-opern
#----------- NNN Configuration End--------------

#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git/"'



ANDROID_HOME=/Volumes/SOFT/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH

export GNU_HOME=/usr/local/opt/make/libexec
export PATH=$GNU_HOME/gnubin:$PATH

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=$HOME/.sdkbox
export PATH=$SDKBOX_HOME/bin:$PATH

export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843

export DENO_HOME="$HOME/.deno"
export PATH="$DENO_HOME/bin:$PATH"

export PATH=~/bin:/opt/local/bin:/usr/local/bin:/opt/local/sbin:/usr/local/sbin:$PATH

#export BREW_REPO="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# Fix pyenv install python on macos bigsure error
#https://stackoverflow.com/questions/66766531/installation-of-python-3-8-fails-with-pyenv-on-macos
#export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
#export MACOSX_DEPLOYMENT_TARGET=10.15
