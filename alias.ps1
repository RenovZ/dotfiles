Set-Alias tpc "curl cip.cc"
#Set-Alias pc4 "proxychains4 -q -f ~/.proxychains.conf"
#Set-Alias xtime "$(which gtime) -f '%Uu %Ss %er %MkB %c %C'"

function ls {
    eza --header --icons --git @args
}
function ll {
    eza --header --icons --git -agl @args
}

# Set-Alias ls "eza --header --icons --git"
# Set-Alias ll "ls -agl"

# Set-Alias ta 'tmux attach -t'
# Set-Alias tad 'tmux attach -d -t'
# Set-Alias ts 'tmux new-session'
# Set-Alias tl 'tmux list-sessions'
# Set-Alias tksv 'tmux kill-server'
# Set-Alias tks 'tmux kill-session -t'

Set-Alias acme.sh "~/.acme.sh/acme.sh"

Set-Alias pn "pnpm"
Set-Alias px "pnpx"
Set-Alias k "kubectl"
Set-Alias h "helm"
#Set-Alias vim "nvim"
Set-Alias zj "zellij"
# Set-Alias lf "yazi" # conflict with ~/.golang/bin/lf
