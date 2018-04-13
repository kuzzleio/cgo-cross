#!/usr/bin/env bash
sed -i "88s/size_t/int/" /go/src/github.com/kuzzleio/sdk-go/internal/wrappers/cgo/kuzzle/jsonc_wrapper.go
cd /go/src/github.com/kuzzleio/sdk-go && /usr/local/go/bin/go get ./... && cd internal/wrappers && make java
objdump -f build/c/libkuzzlesdk.so | grep architecture | cut -d ';' -f1 | cut -d , -f1 | head -1
