# Initialize luarocks path
Invoke-Expression (&luarocks path --bin)

# Initialize thefuck alias
Invoke-Expression (&thefuck --alias)

# Initialize pyenv
Invoke-Expression (&pyenv init -)
Invoke-Expression (&pyenv virtualenv-init -)

# Load nvm
$env:NVM_DIR = "$HOME\.nvm"
if (Test-Path "$env:NVM_DIR\nvm.sh") {
    . "$env:NVM_DIR\nvm.sh"
}
if (Test-Path "$env:NVM_DIR\bash_completion") {
    . "$env:NVM_DIR\bash_completion"
}

# Initialize zoxide
Invoke-Expression (&zoxide init powershell)

# Initialize starship
Invoke-Expression (&starship init powershell)

# Initialize mcfly
Invoke-Expression (&mcfly init powershell)

# Initialize basher
Invoke-Expression (&basher init - powershell)