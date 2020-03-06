#!/usr/bin/env bash

set -eux

docker build . -t parse_a_changelog

docker run \
    --rm \
    -v $PWD/CHANGELOG.md:/CHANGELOG.md \
    parse_a_changelog
