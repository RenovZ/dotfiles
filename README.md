# set asdf auto-completion

```zsh
# intel chip
fpath=(/usr/local/share/asdf/zsh/site-functions/_asdf $fpath)

# apple silicon chip
fpath=(/opt/homebrew/share/asdf/zsh/site-functions/_asdf $fpath)

autoload -U compinit
compinit
```

# set lf auto-completion

```zsh
# intel chip
fpath=(/usr/local/share/lf/zsh/site-functions/_lf $fpath)

# apple silicon chip
fpath=(/opt/homebrew/share/lf/zsh/site-functions/_lf $fpath)

autoload -U compinit
compinit
```

# format spaces to tab

```bash
# replace tabs with 4 spaces
expand -t 4 input_file > output_file

# replace tabs with default number of spaces
expand input_file > output_file

# replace 4 spaces with tabs
unexpand -t 4 input_file > output_file
```
