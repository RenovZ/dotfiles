# Fish Configuration

`~/.config/fish` should point at this repository's `fish/` directory:

```sh
mv ~/.config/fish ~/.config/fish.backup
ln -s ~/.config/dotfiles/fish ~/.config/fish
```

## Layout

| Path | Description |
| --- | --- |
| `config.fish` | Sources `profile.sh` via `bass`, mirrors `fish_terminal_color_theme` to `DOTFILES_APPEARANCE`, loads `fzf-git.fish` |
| `conf.d/` | Vendored tide init/theme, fish 4.3 key-binding migration, fisher/git init, rustup env |
| `functions/` | Vendored tide and `bass` functions plus `__bass.py` |
| `completions/` | atlas, bun, fisher, lfcd, and tide completions |
| `fish_plugins` | Fisher manifest (only `jorgebucaran/fisher`) |

## Shell Integration

- fzf uses the native `fzf --fish` integration: Ctrl-R (history), Ctrl-T (files), Alt-C (directory). The old fzf.fish plugin files are no longer vendored.
- `bass` is vendored; it requires `bash` and `python3`.
- Prompt helpers (tide) run `fish -c` subprocesses that re-source `config.fish`. Those are marked with `DOTFILES_SHELL_INTERACTIVE=0`, so `export.sh` skips its OSC 11 background query: the parent shell is already reading the tty and the reply would leak into the command line. fish's own `fish_terminal_color_theme` detection is mirrored to `DOTFILES_APPEARANCE`, including light/dark switches reported through mode 2031.
- tide and bass are vendored, so `fisher update` does not manage them; `fish_plugins` only manages fisher itself.
- `asdf` is no longer used — `mise` replaces it.
- `lf` completion is vendored as `completions/lfcd.fish`; no manual symlink is needed.
- `conf.d/rustup.fish` only sources `~/.cargo/env.fish` when that file exists.

## Dependencies

- fish 4.x
- bash and python3 (required by `bass`)
- mise (toolchain activation)
- optional: fzf, zoxide, tide (vendored), wsh, wezterm, hermes, orbctl, kubectl, helm, kubebuilder
