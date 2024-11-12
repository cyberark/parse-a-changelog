#!/usr/bin/env bash

set -eux

. build_utils.sh

VERSION=unreleased
# Version derived from CHANGELOG and automated release library
[ -f VERSION ] && VERSION=$(<VERSION)
FULL_VERSION_TAG="$VERSION-$(git_tag)"

function main() {
  retrieve_cyberark_ca_cert
  build_docker_image
}

function build_docker_image() {
  docker build . \
    --tag parse-a-changelog:latest \
    --tag "parse-a-changelog:${FULL_VERSION_TAG}"
}

main
