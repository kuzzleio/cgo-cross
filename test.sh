#!/usr/bin/env bash
set -xe

# Launch tests for each language
export KUZZLE_HOST=kuzzle
sh internal/wrappers/features/e2e.sh java
# ex for c : sh internal/wrappers/features/e2e.sh c
