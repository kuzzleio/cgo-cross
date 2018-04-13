#!/usr/bin/env bash

sed -i "88s/size_t/int/" $GOPATH/src/github.com/kuzzleio/sdk-go/internal/wrappers/cgo/kuzzle/jsonc_wrapper.go
cd $GOPATH/src/github.com/kuzzleio/sdk-go
go get ./...
cd internal/wrappers
make java
