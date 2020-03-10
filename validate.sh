#!/usr/bin/env bash

set -eux

# This script validates the changelog in this repo.

docker run \
    --rm \
    -v $PWD/CHANGELOG.md:/CHANGELOG.md \
    cyberark/parse-a-changelog
