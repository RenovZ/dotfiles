# https://blog.haohtml.com/archives/21778
#export GODEBUG=allocfreetrace=0
#export GOROOT_BOOTSTRAP=/usr/local/go
export GOPATH=~/.golang
export GO111MODULE=on
export GOCACHE=$GOPATH/go-build
export GOENV=$GOPATH/env
export GOPROXY=https://goproxy.cn,direct
export GOFLAGS="-mod=readonly"
# export GOGC=500

export PATH=$GOPATH/bin:$PATH
