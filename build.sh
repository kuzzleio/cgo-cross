#!/usr/bin/env bash
cd /go/src/github.com/kuzzleio/sdk-go && /usr/local/go/bin/go get ./...
cd internal/wrappers
make all
figlet $(objdump -f build/c/libkuzzlesdk.so | grep architecture | cut -d ';' -f1 | cut -d , -f1 | head -1 | cut -d ' ' -f2)
