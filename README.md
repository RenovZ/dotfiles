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
