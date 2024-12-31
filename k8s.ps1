if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    & kubectl completion powershell | Out-String | Invoke-Expression
}

if (Get-Command kubebuilder -ErrorAction SilentlyContinue) {
    & kubebuilder completion powershell | Out-String | Invoke-Expression
}
