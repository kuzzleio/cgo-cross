#!/usr/bin/env bash
set -xe

# Install Go dependencies
cd /go/src/github.com/kuzzleio/sdk-go && /usr/local/go/bin/go get ./...

# Build all languages
cd internal/wrappers && make all

# Print cross-compilation proof
figlet "$(objdump -f build/c/libkuzzlesdk.so | grep architecture | cut -d ';' -f1 | cut -d , -f1 | head -1 | cut -d ' ' -f2)"
