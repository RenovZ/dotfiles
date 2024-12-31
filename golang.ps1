# https://blog.haohtml.com/archives/21778

# $env:GODEBUG = "allocfreetrace=0"
# $env:GOROOT_BOOTSTRAP = "/usr/local/go"
$env:GOPATH = "$HOME\.golang"
$env:GO111MODULE = "on"
$env:GOCACHE = "$env:GOPATH\go-build"
$env:GOENV = "$env:GOPATH\env"
$env:GOPROXY = "https://goproxy.cn,direct"
$env:GOFLAGS = "-mod=readonly"
# $env:GOGC = "500"

$env:PATH = "$env:GOPATH\bin;$env:PATH"
