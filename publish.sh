#!/usr/bin/env bash

set -e

# This script will publish to rubygems and dockerhub

# Clone the release-tools repository if it doesn't exist
if [ ! -d release-tools ]; then
  git clone git@github.com:conjurinc/release-tools.git
fi

export PATH=$PWD/release-tools/bin/:$PATH

# Build and publish rubygem
summon --yaml "RUBYGEMS_API_KEY: !var rubygems/api-key" \
  publish-rubygem parse_a_changelog

# Publish to Docker Hub
TAG_NAME=$1
DOCKERHUB_IMAGE="cyberark/parse-a-changelog"
docker tag parse-a-changelog "${DOCKERHUB_IMAGE}:latest"
docker tag parse-a-changelog "${DOCKERHUB_IMAGE}:${TAG_NAME}"

docker push "${DOCKERHUB_IMAGE}:latest"
docker push "${DOCKERHUB_IMAGE}:${TAG_NAME}"
