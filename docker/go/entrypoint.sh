#! /usr/bin/env sh

export GOARCH=amd64
export GOOS=linux
export GOPATH=/workspace
export GOBIN=/workspace/bin


cd /workspace/src/app

#dep ensure
#go build -a -v -ldflags '-w -extldflags "-static"' ./...
#go install

go run main.go
