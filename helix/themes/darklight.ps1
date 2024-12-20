# 设置 Cargo 的路径
$env:PATH = "$HOME\.cargo\bin;$env:PATH"

# 检查 darklight 的输出
$darklightOutput = & darklight
if ($darklightOutput -match "Dark") {
    $mode = "dark"
} else {
    $mode = "light"
}

# 定义目标主题和符号链接路径
$THEME_TARGET = "$HOME\.config\dotfiles\helix\themes\$mode.toml"
$THEME_LINK = "$HOME\.config\dotfiles\helix\themes\adaptive.toml"

# 获取符号链接的目标文件
if (Test-Path $THEME_LINK) {
    $target_file = (Get-Item $THEME_LINK).Target
} else {
    $target_file = ""
}

# 提取文件名和扩展名
$file_name = [System.IO.Path]::GetFileName($target_file)
$file_name_no_ext = [System.IO.Path]::GetFileNameWithoutExtension($file_name)

# 检查当前链接是否需要更新
if ($file_name_no_ext -notlike "*$mode*") {
    New-Item -ItemType SymbolicLink -Path $THEME_LINK -Target $THEME_TARGET -Force
}

# 输出调试信息（可选）
# Write-Output "mode: $mode"
# Write-Output "target_file: $target_file"
# Write-Output "file_name: $file_name"
# Write-Output "file_name_no_ext: $file_name_no_ext"
