# export LC_ALL=en_US.UTF-8
export EDITOR=hx
export VISUAL=hx
export TIG_EDITOR=hx
export GIT_EDITOR=hx
#export READER="zathura"
export PAGER=ov

# export PATH=/opt/local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
# export PATH=/opt/local/sbin:/opt/homebrew/sbin:/usr/local/sbin:$PATH

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/bin

# asdf
# export PATH=$PATH:${ASDF_DATA_DIR:-~/.asdf}/shims

# mise
export PATH=$PATH:$HOME/.local/share/mise/shims

# c++
export PATH=$PATH:${VCPKG_ROOT:-~/vcpkg}

# export SDKROOT=$(xcrun --show-sdk-path)
# export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# llvm
# export PATH=$(brew --prefix)/opt/llvm/bin:$PATH

# pnpm
export PNPM_HOME=~/.pnpm

# bun
export PATH=$PATH:${BUN_INSTALL:-~/.bun}/bin
# export PATH=$PATH:$HOME/.cache/.bun/bin


# Configure all the other tools after the path has been set.

# Terminal background (light/dark). Query it at every startup so a theme
# toggle is picked up, except in non-interactive shells (fish sets
# DOTFILES_SHELL_INTERACTIVE=0 for prompt-helper subprocesses): there the parent
# shell is already reading the tty, so the OSC 11 reply would be stolen and
# leak into the prompt. fish also mirrors its own detection into
# DOTFILES_APPEARANCE (fish/config.fish). The query must own the tty while it
# reads the reply, so it cannot run inside a TUI; theme-detect refuses when
# lf's LF_LEVEL is set, and lf/lf.sh re-detects before starting lf. On failure
# the inherited value (if any) is kept.
if [ "${DOTFILES_SHELL_INTERACTIVE:-1}" != 0 ]; then
	if _mode=$(~/.config/dotfiles/theme-detect 2>/dev/null); then
		DOTFILES_APPEARANCE=$_mode
		export DOTFILES_APPEARANCE
	fi
	unset _mode
fi

# export FORGIT_PREVIEW_PAGER='bat -l diff --color=always --style=plain'
export FORGIT_PREVIEW_PAGER="delta --diff-highlight --features=\"line-numbers decorations\" --${DOTFILES_APPEARANCE:-dark} --paging=never --width=\"\${FZF_PREVIEW_COLUMNS:-80}\""
export FORGIT_FZF_DEFAULT_OPTS="--no-scrollbar --height=100%"

#export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git/"'
