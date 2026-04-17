# Dotfiles

A macOS-first personal dotfiles repository for shells, terminals, multiplexers, editors, and daily CLI tools. There is no build output here — the files in this repository are the final configuration.

## Features

- **Shells**: `zsh` and `fish` share a common environment/toolchain setup through `profile.sh`
- **zsh**: Powered by Oh My Zsh, Powerlevel10k, `fzf-git.sh`, `zoxide`, and shell completions
- **fish**: Reuses the shared shell environment via `bass`, with `tide`, `fzf`, and `zoxide`
- **Terminals**: Configs for `zellij`, `wezterm`, and `ghostty`
- **Editors**: `helix` and `zed` with theme auto-switching support
- **File Tools**: `lf`, `yazi`, `bat`, and `zathura` configurations
- **Toolchains**: Rust (Cargo), Go, Kubernetes (kubectl/helm/kubebuilder), asdf, pnpm, bun
- **Homebrew**: Configured to use Tsinghua mirrors by default

## Directory Structure

| Path | Description |
| --- | --- |
| `export.sh` | Environment variables and PATH exports (sourced first by `profile.sh`) |
| `profile.sh` | Shared shell entrypoint; loads exports, Homebrew, language env, and aliases |
| `zshrc` / `p10k.zsh` | Main `zsh` config and Powerlevel10k prompt |
| `fish/` | Fish config, functions, completions, and plugin list |
| `zellij/` | `zellij` config with tmux-like keybindings and layouts |
| `wezterm/` / `ghostty/` | Terminal emulator configurations |
| `helix/` | Helix editor config, language settings, and theme auto-switch helpers |
| `lf/` / `yazi/` / `bat/` / `zathura/` | File manager and reader tool configs |
| `cargo/` | Rust Cargo configuration |
| `legacy/` | Archived configs no longer in active use |
| `vendor/fzf-git.sh/` | Git submodule providing `fzf-git.sh` |

## Quick Start

This repository assumes it lives at `~/.config/dotfiles`. If you clone it elsewhere, update the hardcoded source paths accordingly.

```bash
git clone --recurse-submodules <your-repo-url> ~/.config/dotfiles
cd ~/.config/dotfiles
git submodule update --init --recursive
```

Create symlinks selectively. Do not blindly replace your existing setup.

```bash
mkdir -p ~/.config

ln -sfn ~/.config/dotfiles/zshrc ~/.zshrc

ln -sfn ~/.config/dotfiles/helix ~/.config/helix
ln -sfn ~/.config/dotfiles/wezterm ~/.config/wezterm
ln -sfn ~/.config/dotfiles/ghostty ~/.config/ghostty
ln -sfn ~/.config/dotfiles/zellij ~/.config/zellij
ln -sfn ~/.config/dotfiles/yazi ~/.config/yazi
ln -sfn ~/.config/dotfiles/zed ~/.config/zed
```

For `fish`, merge or symlink the repository `fish/` directory into `~/.config/fish`, and ensure `bass` is installed.

## Dependencies

Missing dependencies usually just disable optional completions/prompt integrations; the shell remains functional.

- **Homebrew**
- **Oh My Zsh**
- **Powerlevel10k**
- **fzf**
- **fd**
- **zoxide**
- **asdf**
- **fish** (optional)
- **zellij** (optional)
- **helix** (optional)
- **wezterm** or **ghostty** (optional)
- **kubectl**, **helm**, **kubebuilder** (optional, for completions)

## Notes

- `profile.sh` is the central entrypoint shared by both `zshrc` and `fish/config.fish`
- `homebrew.sh` enables Tsinghua mirrors; modify or skip it if not needed
- `fish/fish_plugins` declares `tide`, `plugin-docker-compose`, `plugin-git`, and `bass`
- `zellij/config.kdl` follows a tmux-like keybinding scheme for easier switching
- `wezterm/wezterm.lua` and `ghostty/config` both use translucent windows and a unified visual style
- See `helix/README.md`, `fish/README.md`, and `lf/README.md` for component-specific notes

## Validation

This is a config repository, so there is no test suite. Syntax checks and manual loading are the appropriate validation methods.

```bash
# shell scripts
shellcheck *.sh

# fish syntax
fish -n fish/config.fish

# zellij
zellij --check

# helix
hx --health
```

## Related Documentation

- [fish/README.md](fish/README.md)
- [helix/README.md](helix/README.md)
- [lf/README.md](lf/README.md)
