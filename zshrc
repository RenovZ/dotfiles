# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
  node autojump sudo osx web-search brew docker docker-compose history z
  tig git git-auto-fetch git-escape-magic git-extras git-flow git-flow-avh git-hubflow git-prompt gitfast github gitignore
  vscode xcode emacs vagrant vagrant-prompt
  tmux tmuxinator httpie npm
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

#antigen theme denysdovhan/spaceship-prompt
#eval "$(starship init zsh)"
antigen theme romkatv/powerlevel10k
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

CUSTOM_SYS_SHELL_HOME=~/.config/sys-config/shell
for file in $CUSTOM_SYS_SHELL_HOME/*;do
    source $file
done

export GNU_HOME=/usr/local/opt/make/libexec

# java configuration
#export JAVA_HOME=/usr/local/Cellar/openjdk@11/11.0.9
export JENV_HOME=~/.jenv
eval "$(jenv init -)"

[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=$HOME/.sdkbox

export GOPATH=/Users/zzq/WorkSpace/Golang
export GO111MODULE=on
export GOCACHE=$GOPATH/go-build
export GOENV=$GOPATH/env
export GOPROXY=https://goproxy.cn
#export GOPROXY=https://goproxy.io
#export GODEBUG=allocfreetrace=1 #,gctrace=1

#export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/mysql-client/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/mysql-client/include"
#export PKG_CONFIG_PATH=$(find /usr/local/Cellar -name 'pkgconfig' -type d | grep lib/pkgconfig | tr '\n' ':' | sed s/.$//)

export LC_ALL=en_US.UTF-8
export EDITOR='vim'

#rust config
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
# refer to https://mirrors.tuna.tsinghua.edu.cn/help/rustup/
#export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
source "$HOME/.cargo/env"
export RUST_BACKTRACE=1
export CARGO_NET_GIT_FETCH_WITH_CLI=true

ANDROID_HOME=/Volumes/SOFT/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Fix pyenv install python on macos bigsure error
#https://stackoverflow.com/questions/66766531/installation-of-python-3-8-fails-with-pyenv-on-macos
export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
export MACOSX_DEPLOYMENT_TARGET=10.15

eval $(luarocks path --bin)
eval $(thefuck --alias)
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(zoxide init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#export PATH="$HOME/.phpenv/bin:$PATH"
#eval "$(phpenv init -)"

alias emacs='TERM=xterm-24bits emacs'
alias man='man -M /usr/local/share/man/zh_CN'
alias tpc="curl cip.cc"
alias pc4="proxychains4 -q -f ~/.proxychains.conf"
alias proxy="all_proxy=socks5://0.0.0.0:1086"
#alias proxy="all_proxy=http://0.0.0.0:1087"
alias unproxy="unset all_proxy"
alias pigcha="all_proxy=http://127.0.0.1:61422"
alias xtime="$(which gtime) -f '%Uu %Ss %er %MkB %c %C'"
alias ash="$(which autossh) -M 0"
alias awk="$(which gawk)"

export PATH=$GNU_HOME/gnubin:/usr/local/opt/llvm/bin:~/bin:$SDKBOX_HOME/bin:$JENV_HOME/bin:$BUNDLE_HOME/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH

#`which archey` -c

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

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

#export BREW_REPO="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
