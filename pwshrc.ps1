# Import-Module posh-git
Import-Module git-aliases -DisableNameChecking

Import-Module psfzf -DisableNameChecking
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# # Plugins
# $plugins = @(
#     "git",
#     "zsh-shift-select",
#     "docker-compose",
#     "rsync",
#     "fzf"
# )

# Source oh-my-posh (equivalent to oh-my-zsh)
# Import-Module oh-my-posh

# # Source powerlevel10k theme
# Import-Module (Join-Path (brew --prefix) "share\powerlevel10k\powerlevel10k.psm1")

# # Source zsh-autosuggestions if it exists
# if (Test-Path (Join-Path (brew --prefix) "share\zsh-autosuggestions\zsh-autosuggestions.psm1")) {
#     Import-Module (Join-Path (brew --prefix) "share\zsh-autosuggestions\zsh-autosuggestions.psm1")
# }

# # Source zsh-syntax-highlighting if it exists
# if (Test-Path (Join-Path (brew --prefix) "share\zsh-syntax-highlighting\zsh-syntax-highlighting.psm1")) {
#     Import-Module (Join-Path (brew --prefix) "share\zsh-syntax-highlighting\zsh-syntax-highlighting.psm1")
# }

# Source wezterm shell completion
Invoke-Expression (& { (wezterm shell-completion --shell power-shell | Out-String) })

# Initialize zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Source helm completion if helm is available
# if (Get-Command helm -ErrorAction SilentlyContinue) {
#     Invoke-Expression (& helm completion powershell)
# }

# Source orbctl completion if orbctl is available
# if (Get-Command orbctl -ErrorAction SilentlyContinue) {
#     Invoke-Expression (& orbctl completion powershell)
# }

# Set FORGIT_FZF_DEFAULT_OPTS environment variable
# $env:FORGIT_FZF_DEFAULT_OPTS = "--cycle --height='100%' --ansi --bind='?:toggle-preview' --bind='alt-w:toggle-preview-wrap' --preview-window='right:60%' +1"

# # Source forgit plugin if it exists
# if (Test-Path (Join-Path (brew --prefix) "share\forgit\forgit.plugin.psm1")) {
#     Import-Module (Join-Path (brew --prefix) "share\forgit\forgit.plugin.psm1")
# }

# # Source JetBrains VM options shell file if it exists
# $vmOptionsShellFile = "$HOME\.jetbrains.vmoptions.ps1"
# if (Test-Path $vmOptionsShellFile) {
#     . $vmOptionsShellFile
# }

# # Source p10k configuration if it exists
# if (Test-Path "$HOME\.p10k.ps1") {
#     . "$HOME\.p10k.ps1"
# }

# Initialize fzf
# Invoke-Expression (& { (fzf --powershell | Out-String) })

# Source custom profile and scripts
. $HOME\.config\dotfiles\profile.ps1
# . $HOME\.config\dotfiles\fzf-git.ps1
# . $HOME\.config\dotfiles\bind.ps1

# # Source kubectl and kubebuilder completions if they exist
# if (Test-Path (Join-Path (brew --prefix) "share\zsh-completions")) {
#     if (Get-Command kubectl -ErrorAction SilentlyContinue) {
#         Invoke-Expression (& kubectl completion powershell)
#     }
#     if (Get-Command kubebuilder -ErrorAction SilentlyContinue) {
#         Invoke-Expression (& kubebuilder completion powershell)
#     }
# }

Invoke-Expression (&starship init powershell)