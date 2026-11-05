# Dotfiles

A Linux-first personal dotfiles repository for shells, terminals, multiplexers, editors, and daily CLI tools. macOS is still supported; Homebrew-only integrations are optional. There is no build output here — the files in this repository are the final configuration.

## Usage

```bash
git clone git@github.com:RenovZ/dotfiles.git -- ~/.config/dotfiles
```

**zsh**:

```bash
cp ~/.zshrc ~/.zshrc.backup
ln -sf ~/.config/dotfiles/zshrc ~/.zshrc
```

**fish**:

```bash
cd ~/.config
mv fish fish.backup
ln -s dotfiles/fish .
```

## Shell Layering

`profile.sh` is the shared entrypoint. Each shell loads it plus an optional machine-local profile:

| Shell | Loads |
| --- | --- |
| zsh | `zshrc` → `~/.config/dotfiles/profile.sh` → `~/.profile.zsh` |
| fish | `fish/config.fish` → `bass source profile.sh` → `~/.profile.fish` |
| bash | `~/.bashrc` (not versioned here) |

The `~/.profile.sh`, `~/.profile.fish`, and `~/.profile.zsh` files are the optional host-specific layer. They provide:

- mise activation, zoxide, and shell-specific fzf integration;
- completions for wsh/wezterm/hermes/orbctl and kubectl/helm/kubebuilder;
- a `GH_TOKEN` fallback: use an existing `GH_TOKEN` if set, otherwise `gh auth token` (no plaintext token in any config).

`profile.sh` itself sources `~/.profile.sh` (if present), `export.sh`, `golang.sh`, `alias.sh`, and `bat.sh`, then applies `ulimit -n 65535`.

## Features

- **Shells**: fish is the default login shell; zsh is fully configured; bash gets mise and the gh token fallback.
- **zsh**: works without Oh My Zsh; when Homebrew is available it loads Powerlevel10k, zsh-autosuggestions, and zsh-syntax-highlighting. `fzf-git.sh` and native fzf/zoxide integration are included.
- **fish**: shared environment via vendored `bass`, tide prompt, native fzf bindings (Ctrl-R / Ctrl-T / Alt-C), zoxide, and mise.
- **Terminals**: configs for `zellij`, `wezterm`, `ghostty`, and `alacritty`.
- **Editors**: Helix config with language settings and theme auto-switching helpers.
- **File Tools**: `lf` (git integration, previews), `bat`, and `ov` (pager).
- **Toolchains**: mise-managed CLI tools, Rust via rustup (`~/.cargo/env`), and Go; Kubernetes completions are optional.
- **Homebrew**: optional; `homebrew.sh` contains Tsinghua mirror settings but is not sourced by default.

## Directory Structure

| Path | Description |
| --- | --- |
| `profile.sh` | Shared shell entrypoint (exports, language env, aliases, optional `~/.profile.sh`) |
| `export.sh` | Environment variables and PATH exports (sourced first by `profile.sh`) |
| `alias.sh` / `bat.sh` / `golang.sh` | Shell fragments sourced by `profile.sh` |
| `homebrew.sh` | Optional Homebrew mirror configuration (disabled by default) |
| `zshrc` / `p10k.zsh` | zsh config; Powerlevel10k config sourced directly from this repo |
| `fish/` | Fish config, vendored functions (tide, bass), completions, and fisher manifest |
| `bootstrap.sh` | Debian/Ubuntu bootstrap: apt packages, mise, fish, and symlinks |
| `zellij/` / `wezterm/` / `ghostty/` / `alacritty/` | Terminal configs |
| `helix/` | Helix editor config and theme helpers |
| `lf/` / `bat/` / `ov/` | File manager, bat, and pager configs |
| `cargo/` / `pip/` | Cargo and pip configs |
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

ln -sfn ~/.config/dotfiles/zshrc     ~/.zshrc
ln -sfn ~/.config/dotfiles/fish      ~/.config/fish
ln -sfn ~/.config/dotfiles/helix     ~/.config/helix
ln -sfn ~/.config/dotfiles/lf        ~/.config/lf
ln -sfn ~/.config/dotfiles/wezterm   ~/.config/wezterm
ln -sfn ~/.config/dotfiles/ghostty   ~/.config/ghostty
ln -sfn ~/.config/dotfiles/zellij    ~/.config/zellij
ln -sfn ~/.config/dotfiles/alacritty ~/.config/alacritty
ln -sfn ~/.config/dotfiles/bat       ~/.config/bat
ln -sfn ~/.config/dotfiles/ov        ~/.config/ov
ln -sfn ~/.config/dotfiles/pip       ~/.config/pip
```

`bass` is required for fish and is vendored in `fish/functions/` (it needs `bash` and `python3`).

## Dependencies

Missing dependencies usually just disable optional completions/prompt integrations; the shell remains functional.

- **mise** (recommended; `bootstrap.sh` installs the CLI tools through it)
- **fish** + **bass** (vendored; needs `bash` and `python3`)
- **zsh** (optional)
- **gh** (provides `GH_TOKEN` via `gh auth token`)
- **fzf**, **fd**, **zoxide**, **ripgrep**, **bat**, **delta**, **eza**, **ov**
- **kubectl**, **helm**, **kubebuilder** (optional, for completions)
- **Homebrew** (optional, only for the zsh plugins below)
- **Oh My Zsh**, **Powerlevel10k**, **zsh-autosuggestions**, **zsh-syntax-highlighting** (optional)
- **helix**, **zellij**, **wezterm** or **ghostty** (optional)

## Notes

- `profile.sh` is the central entrypoint shared by `zshrc` and `fish/config.fish`.
- `homebrew.sh` is intentionally not sourced by `profile.sh`; enable it on macOS if you rely on the Tsinghua mirror settings.
- `fish/fish_plugins` only declares `jorgebucaran/fisher`; tide and bass are vendored under `fish/functions` and `fish/conf.d`, and `fzf-git.sh` comes from the vendor submodule. `fisher update` does not manage the vendored plugins.
- fish uses the native `fzf --fish` integration (Ctrl-R / Ctrl-T / Alt-C); the old fzf.fish plugin files are no longer vendored.
- `p10k.zsh` is sourced from `~/.config/dotfiles/p10k.zsh`; no `~/.p10k.zsh` symlink is required.
- `zellij/config.kdl` follows a tmux-like keybinding scheme for easier switching.
- `wezterm/wezterm.lua` and `ghostty/config` both use translucent windows and a unified visual style.
- See `helix/README.md`, `fish/README.md`, and `lf/README.md` for component-specific notes.

## Validation

This is a config repository, so there is no test suite. Syntax checks and manual loading are the appropriate validation methods.

```bash
# shell scripts
for f in *.sh; do bash -n "$f"; done
shellcheck *.sh

# zsh
zsh -n zshrc

# fish (one file at a time; fish -n only checks its first argument)
for f in fish/config.fish fish/conf.d/*.fish; do fish -n "$f"; done

# zellij
zellij --check

# helix
hx --health
```

## Related Documentation

- [fish/README.md](fish/README.md)
- [helix/README.md](helix/README.md)
- [lf/README.md](lf/README.md)
