# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  node autojump sudo osx web-search brew docker history z
  tig git git-auto-fetch git-escape-magic git-extras git-flow git-flow-avh git-hubflow git-prompt gitfast github gitignore
  vscode xcode emacs
  tmux httpie npm
)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

#ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
source ~/Bundler/zsh-plugin-manager/antigen.zsh

# antigen plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zaw

antigen theme denysdovhan/spaceship-prompt
antigen apply

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export BUNDLE_HOME=$HOME/Bundler
source $BUNDLE_HOME/iterm2_shell_integration.zsh

CUSTOM_SYS_SHELL_HOME=~/.config/sys_shell/shell
for file in $CUSTOM_SYS_SHELL_HOME/*;do
    source $file
done

#alias mongo_deamon="/usr/local/bin/mongod --dbpath ~/data/db --fork --logpath ~/data/logs/mongodb.log"

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# JAVA_HOME
#export JDK_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk
export JDK_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk
export JAVA_HOME=$JDK_HOME/Contents/Home
#export JDK_HOME=/usr/local/opt/openjdk@11
#export JAVA_HOME=$JDK_HOME/libexec/openjdk.jdk/Contents/Home
export JRE_HOME=$JAVA_HOME/jre

[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=$HOME/.sdkbox

export GOPATH=/Users/zzq/WorkSpace/Golang
#export GO111MODULE=on
export GOCACHE=$GOPATH/go-build
export GOENV=$GOPATH/env
export GOPROXY=https://goproxy.cn
#export GOPROXY=https://goproxy.io
#export GODEBUG=allocfreetrace=1 #,gctrace=1

export ICU4C_HOME=/usr/local/opt/icu4c
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig
export GREP_OPTIONS='--color=auto'
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LIBRARY_PATH=/usr/local/Cellar/libtensorflow/2.3.0/lib
export DYLD_LIBRARY_PATH=/usr/local/Cellar/libtensorflow/2.3.0/lib
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"
#export SQLITE3_HOME=

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

eval $(luarocks path --bin)
eval $(thefuck --alias)
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias emacs='TERM=xterm-24bits emacs'
alias man='man -M /usr/local/share/man/zh_CN'
alias tpc="curl cip.cc"
alias pc4="proxychains4 -q -f ~/.proxychains.conf"
alias proxy="all_proxy=socks5://127.0.0.1:1086"
alias unproxy="unset all_proxy"

export PATH=~/bin:$ICU4C_HOME/bin:$ICU4C_HOME/sbin:$SDKBOX_HOME/bin:$BUNDLE_HOME/bin:$GOPATH/bin:/usr/local/sbin:$PATH

#`which archey` -c
export HOMEBREW_GITHUB_API_TOKEN=***REMOVED***
#export PATH="/usr/local/opt/python@3.8/bin:$PATH"
#export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"
#export LDFLAGS="-L/usr/local/opt/python@3.8/lib"

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

export BREW_REPO="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
