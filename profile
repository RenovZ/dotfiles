CUSTOM_SYS_SHELL_HOME=~/.config/sys-config/shell
for file in $CUSTOM_SYS_SHELL_HOME/*;do
    source $file
done

. ~/.config/sys-config/rust.sh
. ~/.config/sys-config/golang.sh
. ~/.config/sys-config/export.sh
. ~/.config/sys-config/alias.sh

# PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

eval "$(luarocks path --bin)"
eval "$(thefuck --alias)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

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
. "/Users/zzq/.acme.sh/acme.sh.env"
