CUSTOM_SYS_SHELL_HOME=~/.config/sys-config/shell
for file in $CUSTOM_SYS_SHELL_HOME/*;do
    source $file
done

export GNU_HOME=/usr/local/opt/make/libexec

# c++ configuration
export VCPKG_ROOT="$HOME/vcpkg"

# java configuration
#export JAVA_HOME=/usr/local/Cellar/openjdk@11/11.0.9

[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=$HOME/.sdkbox

# https://blog.haohtml.com/archives/21778
#export GODEBUG=allocfreetrace=0
export GOROOT_BOOTSTRAP=/usr/local/go
export GOPATH=~/WorkSpace/Golang
export GO111MODULE=on
export GOCACHE=$GOPATH/go-build
export GOENV=$GOPATH/env
export GOPROXY=https://goproxy.cn
#export GOPROXY=https://goproxy.io

#export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/mysql-client/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/mysql-client/include"
#export PKG_CONFIG_PATH=$(find /usr/local/Cellar -name 'pkgconfig' -type d | grep lib/pkgconfig | tr '\n' ':' | sed s/.$//)

#export C_INCLUDE_PATH=/usr/local/opt/openssl/include
#export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

export LC_ALL=en_US.UTF-8
export EDITOR='vim'
# #export VIMEDITOR='vim'

#rust config
. "$HOME/.cargo/env"
##export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
## refer to https://mirrors.tuna.tsinghua.edu.cn/help/rustup/
##export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
##export RUST_BACKTRACE=1
#export CARGO_NET_GIT_FETCH_WITH_CLI=true

ANDROID_HOME=/Volumes/SOFT/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH

# PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

eval "$(luarocks path --bin)"
#eval "$(thefuck --alias)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#export DISPLAY=:0
#export ICONLOOKUP=1
#export USE_SCOPE=1
#export USE_PISTOL=1
#export TERMINAL='iterm'
#export PREVIEW_MODE=0

#nnn configuration
#export NNN_PREVIEWWIDTH=1000
#export NNN_OPTS="cEnrx"
export NNN_TRASH=1
export NNN_HELP='pwy paris'
export NNN_FIFO='/tmp/nnn.fifo'
#export NNN_BMS='i:~/.local/pics;w:~/.local/wiki'
export NNN_SEL='/tmp/.sel'
export NNN_PLUG='v:imgview;f:fzcd;t:preview-tui;p:-!less -iR $nnn*'

#clashx proxy config
#export https_proxy=http://127.0.0.1:7890
#export http_proxy=http://127.0.0.1:7890
#export all_proxy=socks5://127.0.0.1:7890

#alias vim="nvim"

#alias man='man -M /usr/local/share/man/zh_CN'
alias tpc="curl cip.cc"
alias pc4="proxychains4 -q -f ~/.proxychains.conf"
alias proxy="all_proxy=socks5://127.0.0.1:7890"
alias unproxy="unset all_proxy"
alias pigcha="all_proxy=http://127.0.0.1:61422"
#alias xtime="$(which gtime) -f '%Uu %Ss %er %MkB %c %C'"
#alias ash="$(which autossh) -M 0"
#alias awk="$(which gawk)"
alias ls="exa --header --icons --git"
alias ll="ls -agl"
alias cat="bat"
alias du="ncdu"
alias df="duf"
alias top="htop"
alias find="fd"
alias man="tldr"
alias ps="procs"

alias emacs='TERM=xterm-24bits emacs'

export PATH=$GNU_HOME/gnubin:/usr/local/opt/llvm/bin:~/bin:$SDKBOX_HOME/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH

export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
eval "$(basher init - zsh)"             ##basher5ea843

#export BREW_REPO="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# Fix pyenv install python on macos bigsure error
#https://stackoverflow.com/questions/66766531/installation-of-python-3-8-fails-with-pyenv-on-macos
#export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
#export MACOSX_DEPLOYMENT_TARGET=10.15


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

if [ -e /Users/zzq/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/zzq/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer