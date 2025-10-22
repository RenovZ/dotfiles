# https://blog.haohtml.com/archives/21778
#export GODEBUG=allocfreetrace=0
#export GOROOT_BOOTSTRAP=/usr/local/go
export CGO_CFLAGS="-O2 -g -I$(brew --prefix)/include"
export CGO_CXXFLAGS="-O2 -g -I$(brew --prefix)/include"
export CGO_FFLAGS="-O2 -g -I$(brew --prefix)/include"
export CGO_LDFLAGS="-O2 -g -L$(brew --prefix)/lib"
export GOPATH=~/.golang
export GOBIN=$GOPATH/bin
export GO111MODULE=on
export GOCACHE=$GOPATH/go-build
export GOENV=$GOPATH/env
export GOPROXY=https://goproxy.cn,direct
export GOFLAGS="-mod=readonly"
# export GOGC=500
export GOTELEMETRYDIR=$GOPATH/telemetry

export PATH=$GOPATH/bin:$PATH
