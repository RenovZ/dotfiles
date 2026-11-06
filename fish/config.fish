# Bootstrap: ensure /opt/homebrew/bin is in PATH before bass runs,
# so that asdf shims (used by bass via python3) can find the `asdf` binary.
# fish_add_path --prepend /opt/homebrew/bin /opt/homebrew/sbin

# Prompt helpers such as tide run `fish -c ...` subprocesses, which source this
# file again. Those non-interactive shells must not query the terminal
# background: the parent fish is already reading input and the OSC 11 reply
# would leak into the command line.
if status is-interactive
    set -gx DOTFILES_SHELL_INTERACTIVE 1
else
    set -gx DOTFILES_SHELL_INTERACTIVE 0
end
bass source ~/.config/dotfiles/profile.sh
set -e DOTFILES_SHELL_INTERACTIVE

# fish detects the terminal background itself (fish_terminal_color_theme) and
# updates it when the terminal switches light/dark; mirror it into the variable
# read by lf, delta and forgit so a theme switch needs no extra query.
function __dotfiles_export_appearance --on-variable fish_terminal_color_theme
    switch "$fish_terminal_color_theme"
        case light dark
            set -gx DOTFILES_APPEARANCE $fish_terminal_color_theme
    end
end

# source ~/.config/fish/asdf.fish
source ~/.config/dotfiles/vendor/fzf-git.sh/fzf-git.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.profile.fish 2>/dev/null || :

# Deduplicate PATH while preserving order; profile scripts append the same
# directories on every nested shell.
set -gx PATH (printf '%s\n' $PATH | awk '!seen[$0]++')
