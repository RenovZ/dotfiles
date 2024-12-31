# $env:LDFLAGS = "-L/usr/local/opt/llvm/lib -L/usr/local/opt/mysql-client/lib"
# $env:CPPFLAGS = "-I/usr/local/opt/llvm/include -I/usr/local/opt/mysql-client/include"
# $env:PKG_CONFIG_PATH = (Get-ChildItem -Path /usr/local/Cellar -Recurse -Filter 'pkgconfig' -Directory | Where-Object { $_.FullName -match 'lib/pkgconfig' } | ForEach-Object { $_.FullName } -join ':')

# $env:C_INCLUDE_PATH = "/usr/local/opt/openssl/include"
# $env:CPLUS_INCLUDE_PATH = $env:C_INCLUDE_PATH

$env:LC_ALL = "en_US.UTF-8"
# $env:EDITOR = "nvim"
# $env:EDITOR = "hx"
# $env:TIG_EDITOR = "hx"
# $env:GIT_EDITOR = "hx"
# $env:READER = "zathura"

# C++ configuration
$env:VCPKG_ROOT = "$HOME\vcpkg"
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"

# $env:FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git"'
$env:FZF_DEFAULT_COMMAND = 'fd --type f -H -E ".git/"'

# Android SDK
$env:ANDROID_SDK_ROOT = "$HOME\Android"
$env:PATH = "$env:ANDROID_SDK_ROOT\tools;$env:ANDROID_SDK_ROOT\platform-tools;$env:PATH"

# Add environment variable SDKBOX_HOME for sdkbox installer
$env:SDKBOX_HOME = "$HOME\.sdkbox"
$env:PATH = "$env:SDKBOX_HOME\bin;$env:PATH"

# $env:DENO_HOME = "$HOME\.deno"
# $env:PATH = "$env:DENO_HOME\bin;$env:PATH"

# PNPM
$env:PNPM_HOME = "$HOME\.pnpm"
$env:PATH = "$env:PNPM_HOME;$env:PATH"

# Add ~/bin to PATH
$env:PATH = "$HOME\bin;$env:PATH"

# EMSDK
$env:EMSDK_QUIET = 1
$env:PATH = "$env:EMSDK_HOME;$env:EMSDK_HOME\upstream\emscripten;$env:PATH"

# Flutter
$env:PATH = "$HOME\fvm\default\bin;$env:PATH"

# Sciter SDK
# $env:SCITER_SDK_ROOT = "$HOME\Store\sciter-sdk\bin.osx\"
# $env:DYLD_LIBRARY_PATH = $env:SCITER_SDK_ROOT