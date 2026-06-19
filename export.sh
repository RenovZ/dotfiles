# export LC_ALL=en_US.UTF-8
export EDITOR=hx
export VISUAL=hx
export TIG_EDITOR=hx
export GIT_EDITOR=hx
#export READER="zathura"
export PAGER=ov

export PATH=/opt/local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
export PATH=/opt/local/sbin:/opt/homebrew/sbin:/usr/local/sbin:$PATH

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/bin

# asdf
export PATH=$PATH:${ASDF_DATA_DIR:-~/.asdf}/shims

# c++
export PATH=${VCPKG_ROOT:-~/vcpkg}:$PATH

export SDKROOT=$(xcrun --show-sdk-path)
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# llvm
export PATH=$(brew --prefix)/opt/llvm/bin:$PATH

# pnpm
export PNPM_HOME=~/.pnpm

# bun
export PATH=$PATH:${BUN_INSTALL:-~/.bun}/bin


# configure all the other tools after the path has been set

# export FORGIT_PREVIEW_PAGER='bat -l diff --color=always --style=plain'
export FORGIT_PREVIEW_PAGER="delta --diff-highlight --features=\"line-numbers decorations\" --$($HOME/.cargo/bin/darklight 2>/dev/null | tr '[:upper:]' '[:lower:]') --paging=never --width=\"\${FZF_PREVIEW_COLUMNS:-80}\""
export FORGIT_FZF_DEFAULT_OPTS="--no-scrollbar --height=100%"

#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git/"'
