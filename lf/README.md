# lf (Larry File Manager) Configuration

A feature-rich lf configuration with image previews, git integration, fuzzy search, and more.

## Directory Structure

```
lf/
├── lfrc          # Main lf configuration
├── preview       # File preview script
├── cleaner       # Preview cleanup script
├── icons         # Nerd Fonts icon mappings
├── colors        # Terminal color scheme
├── rg_search.sh  # ripgrep + fzf search script
├── lf.1          # Shell wrapper script
└── README.md     # This file
```

## Prerequisites

### Core Tools (Required)

| Tool | Purpose | Installation |
|------|---------|--------------|
| `lf` | File manager | `brew install lf` / `apt install lf` |
| `fzf` | Fuzzy finder | `brew install fzf` / `apt install fzf` |
| `bat` | Code syntax highlighting | `brew install bat` / `apt install bat` |
| `fd` | Fast file finder (find alternative) | `brew install fd` / `apt install fd-find` |
| `ripgrep` (rg) | Fast grep | `brew install ripgrep` / `apt install ripgrep` |
| `zoxide` | Smart cd | `brew install zoxide` / See [zoxide install](https://github.comajeetdsouza/zoxide) |

### Image Preview Tools

| Tool | Platform | Quality | Installation |
|------|----------|---------|--------------|
| **chafa** | X11 + Wayland + Sixel | ★★★★★ | `brew install chafa` / `apt install chafa` |
| **kitty icat** | Kitty only | ★★★★★ | Use Kitty terminal |
| **ctpv** | X11 + Wayland | ★★★★ | `brew install ctpv` / build from source |

**Recommendation**: Install `chafa` — works on any terminal with Sixel support (iTerm2, WezTerm, Ghostty, Kitty, Konsole) and requires no X11/Wayland.

**Note**: The current config uses `ctpv` for convenience. If you encounter issues with newer lf versions, switch to pure chafa.

### Optional Tools

| Tool | Purpose | Used For |
|------|---------|----------|
| `exa` / `eza` | ls alternative | File stats display |
| `trash-cli` | Trash management | `:trash` command |
| `jq` | JSON processor | npm scripts (in lfrc) |
| `git-forgit` | Git UI wrapper | Git commands (ga, gp, gl, etc.) |
| `glow` | Markdown renderer | .md file preview |
| `darklight` | Theme detection | Markdown theme selection |
| `chafa` | Terminal image renderer | Images, PDFs, videos |

### Archive & Document Tools

| Tool | Format | Installation |
|------|--------|--------------|
| `tar` | .tar, .tar.gz, .tar.bz2, .tar.xz | Built-in |
| `unzip` | .zip, .jar, .war, .ear | Built-in |
| `unrar` | .rar | `apt install unrar` |
| `7z` | .7z | `apt install p7zip-full` |
| `w3m` | HTML rendering | `apt install w3m` |
| `catdoc` | .doc files | `apt install catdoc` |
| `docx2txt` | .docx files | `pip install docx2txt` |
| `odt2txt` | .odt, .ods, .odp | `apt install odt2txt` |
| `ssconvert` | Spreadsheets | `apt install gnumeric` |
| `pdftoppm` | PDF to image | `apt install poppler-utils` |

### Media Tools

| Tool | Purpose | Installation |
|------|---------|--------------|
| `exiftool` | Audio/video metadata | `brew install exiftool` / `apt install libimage-exiftool-perl` |
| `transmission-show` | Torrent files | `apt install transmission-cli` |
| `iso-info` | ISO metadata | `apt install iso-info` |

## Installation

### 1. Install lf

```bash
# macOS
brew install lf

# Ubuntu/Debian
sudo apt install lf

# Or build from source
go install github.com/gokcehan/lf@latest
```

### 2. Install Dependencies

```bash
# macOS
brew install chafa eza fzf fd ripgrep bat zoxide glow

# 可选（提升体验）
brew install poppler ffmpegthumbnailer exiftool w3m

# Ubuntu/Debian
sudo apt install chafa eza fzf fd-find ripgrep bat zoxide glow \
    w3m catdoc odt2txt unrar p7zip-full gnumeric poppler-utils
```

### 3. Link Configuration

```bash
# Create directories
mkdir -p ~/.config/lf
mkdir -p ~/.local/bin

# Link files
ln -sf ~/.config/dotfiles/lf/lfrc ~/.config/lf/lfrc
ln -sf ~/.config/dotfiles/lf/icons ~/.config/lf/icons
ln -sf ~/.config/dotfiles/lf/colors ~/.config/lf/colors

# Install ctpv (optional, for quick previews)
# macOS
brew install ctpv
# Ubuntu: build from source or use chafa directly
```

### 4. Install Nerd Fonts

This configuration uses Nerd Fonts for icons. Install one:

```bash
# macOS
brew install --cask font-jetbrains-mono-nerd-font

# Or download from https://www.nerdfonts.com
```

Configure your terminal to use the Nerd Font.

### 5. Configure Your Shell

Add to `~/.bashrc` or `~/.zshrc`:

```bash
# lf shell integration (cd on exit)
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
alias lf='lfcd'
```

## Key Bindings

### Navigation
| Key | Action |
|-----|--------|
| `h/j/k/l` | Navigate (or arrow keys) |
| `g` / `G` | Go to top/bottom |
| `Enter` | Open file or enter directory |
| `i` | Preview file |
| `q` | Quit |

### File Operations
| Key | Action |
|-----|--------|
| `o` | Create new file/directory |
| `od` | Create new directory |
| `of` | Create new file |
| `x` | Delete file |
| `.` | Toggle hidden files |

### Git Commands
| Key | Action |
|-----|--------|
| `ga` | git add |
| `gp` | git push |
| `gd` | git diff |
| `gu` | git pull |
| `gl` | git log |
| `gst` | git status |
| `gcb` | git checkout branch |
| `gbl` | git blame |
| `gss` | git stash show |
| `gbd` | git branch delete |

### Search & Jump
| Key | Action |
|-----|--------|
| `f` | Open file with $EDITOR via fzf |
| `fg` | fzf search (ripgrep) |
| `fj` | fzf jump to directory |
| `fs` | ripgrep search |
| `fd` | fd search (no hidden) |
| `fh` | fd search (with hidden) |
| `fi` | fd search (no ignore) |
| `fa` | fd search (all) |

### Zoxide Integration
| Key | Action |
|-----|--------|
| `z` | Jump to directory with zoxide |
| `zi` | Interactive zoxide jump |

## Preview Configuration

The config uses `ctpv` for fast image previews. For maximum compatibility, use chafa directly.

### Current Setup (ctpv)

```rc
set previewer ctpv
set cleaner ctpvclear
&ctpv -s $id
&ctpvquit $id
```

### Alternative: Pure chafa

If ctpv causes issues, edit `~/.config/lf/lfrc`:

```rc
set previewer ~/.config/lf/preview
set cleaner ~/.config/lf/cleaner
```

### Terminal Sixel Support

Image previews require Sixel support. Check if your terminal supports it:

| Terminal | Sixel Support |
|----------|---------------|
| iTerm2 | ✅ Native |
| WezTerm | ✅ Native |
| Ghostty | ✅ Native |
| Kitty | ✅ Native |
| Konsole | ✅ Native |
| GNOME Terminal | ❌ |
| macOS Terminal | ❌ |

### Preview File Types

| Extension(s) | Preview Method |
|--------------|----------------|
| Images (jpg, png, gif, webp, etc.) | chafa / ctpv |
| PDF | chafa (renders first page) |
| Video (mp4, mkv, avi, etc.) | chafa (first frame) |
| EPUB, CBZ, CBR | chafa (cover) |
| Markdown (.md) | glow (with darklight theme) |
| Source code | bat (syntax highlighting) |
| Archives (.tar, .zip, .7z, etc.) | List contents |
| Audio | exiftool metadata |
| Documents (.doc, .docx, .odt) | Text extraction |
| Man pages | man + col |
| HTML | w3m dump |

## Troubleshooting

### Images not showing

1. Ensure `chafa` is installed: `chafa --version`
2. Check terminal supports Sixel
3. For ctpv: Ensure it's running: `ctpv -s $id`

### ctpv errors with newer lf

If you see API errors, switch to pure chafa preview script or use [ueberzugpp](https://github.com/jstkdng/ueberzugpp).

### Nerd Fonts icons not showing

1. Install a Nerd Font
2. Configure terminal to use it
3. Check `icons` file is linked to `~/.config/lf/icons`

### Permission denied on scripts

```bash
chmod +x ~/.config/lf/preview
chmod +x ~/.config/lf/cleaner
chmod +x ~/.local/bin/lf
```

## Customization

### Change Preview Backend

Edit `~/.config/lf/lfrc`:

```rc
# Use ctpv (default)
set previewer ctpv
set cleaner ctpvclear

# Or use chafa directly
# set previewer ~/.config/lf/preview
# set cleaner ~/.config/lf/cleaner
```

### Change Icons

Edit `~/.config/lf/icons` - uses same format as vim-devicons.

### Change Colors

Edit `~/.config/lf/colors` - uses dircolors format.

## See Also

- [lf GitHub](https://github.com/gokcehan/lf)
- [lf Wiki - Previews](https://github-wiki-see.page/m/gokcehan/lf/wiki/Previews)
- [chafa](https://github.com/hpjansson/chafa)
- [ctpv](https://github.com/NikitaIvanovV/ctpv)
- [Nerd Fonts](https://www.nerdfonts.com)
