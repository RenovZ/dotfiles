Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

Set-PSReadLineOption -PredictionSource HistoryAndPlugin

Import-Module Terminal-Icons

Import-Module posh-git
Import-Module git-aliases -DisableNameChecking

Import-Module psfzf -DisableNameChecking
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Source oh-my-posh (equivalent to oh-my-zsh)
# oh-my-posh init powershell --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/agnoster.omp.json' | Invoke-Expression

Invoke-Expression (&starship init powershell)

# Source wezterm shell completion
Invoke-Expression (& { (wezterm shell-completion --shell power-shell | Out-String) })

# Initialize zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })


# 在bash中，`source`等价于`.`，其中`.`是bash内置的命令
# 在其他的posix兼容的shell中（如：sh、dash等)，可能不支持`source`，只能使用`.`来执行脚本
. $HOME\.config\dotfiles\rust.ps1
. $HOME\.config\dotfiles\golang.ps1
. $HOME\.config\dotfiles\export.ps1
. $HOME\.config\dotfiles\alias.ps1
. $HOME\.config\dotfiles\tinygo.ps1
. $HOME\.config\dotfiles\bat.ps1

# Load development profile if it exists
if (Test-Path $HOME\.devprofile.ps1) {
    . $HOME\.devprofile.ps1
}

# Load Docker bashrc if it exists
if (Test-Path $HOME\.bashrc_docker.ps1) {
    . $HOME\.bashrc_docker.ps1
}

# Load acme.sh environment if it exists
if (Test-Path $HOME\.acme.sh\acme.sh.env) {
    . $HOME\.acme.sh\acme.sh.env
}

# Load asdf if it exists
if (Test-Path $HOME\.asdf\asdf.ps1) {
    . $HOME\.asdf\asdf.ps1
}

# type luarocks >/dev/null 2>&1 && eval "$(luarocks path --bin)"
# if (Get-Command luarocks -ErrorAction SilentlyContinue) {
#     Invoke-Expression (&luarocks path --bin)
# }

# Wasmer
$env:WASMER_DIR = "$HOME\.wasmer"
# bugfix：can't execute with bass script
# -s 检查文件是否存在且非空
# -f 检查文件是否存在且为普通文件
# 实际情况是使用一行的以下 bash 脚本，bass 解析失败
# [ -s $WASMER_DIR/wasmer.sh ] && source $WASMER_DIR/wasmer.sh
# [ -f $WASMER_DIR/wasmer.sh ] && source $WASMER_DIR/wasmer.sh
if (Test-Path "$env:WASMER_DIR\wasmer.ps1") {
    . "$env:WASMER_DIR\wasmer.ps1"
}

# emsdk
$env:EMSDK_HOME = "$HOME\emsdk"
if (Test-Path "$env:EMSDK_HOME\emsdk_env.ps1") {
    . "$env:EMSDK_HOME\emsdk_env.ps1"
}
