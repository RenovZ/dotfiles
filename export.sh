# export LC_ALL=en_US.UTF-8
export EDITOR=hx
export VISUAL=hx
export TIG_EDITOR=hx
export GIT_EDITOR=hx
#export READER="zathura"

#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git/"'

export PATH=~/.local/bin:$PATH

export PATH=/opt/local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
export PATH=/opt/local/sbin:/opt/homebrew/sbin:/usr/local/sbin:$PATH

# c++
export VCPKG_ROOT=~/vcpkg
export PATH=$VCPKG_ROOT:$PATH

export PATH=~/bin:$PATH

# asdf
export PATH="${ASDF_DATA_DIR:-~/.asdf}/shims:$PATH"

export SDKROOT=$(xcrun --show-sdk-path)
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# llvm
export PATH=$(brew --prefix)/opt/llvm/bin:$PATH

# pnpm
export PNPM_HOME=~/.pnpm
export PATH=$PNPM_HOME:$PATH

# bun
export BUN_INSTALL=~/.bun
export PATH=~/.bun/bin:$PATH
