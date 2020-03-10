#!/usr/bin/env bash

# This script will publish to rubygems and dockerhub

if [[ -z "${TAG_NAME:-}" ]]; then
  echo "Please supply environment variable TAG_NAME."
  echo "If you see this error in Jenkins it means the publish script was run"
  echo "for a build that wasn't triggered by a tag - please check publish stage conditions."
  exit 1
fi

set -eux

DOCKERHUB_IMAGE="cyberark/parse-a-changelog"

## Publish Gem
# Image created by https://github.com/conjurinc/publish-rubygem
docker pull registry.tld/conjurinc/publish-rubygem

summon --yaml "RUBYGEMS_API_KEY: !var rubygems/api-key" \
  docker run --rm --env-file @SUMMONENVFILE -v "$(pwd)":/opt/src \
  registry.tld/conjurinc/publish-rubygem parse_a_changelog

## Publish to Docker Hub
docker tag parse-a-changelog "${DOCKERHUB_IMAGE}:latest"
docker tag parse-a-changelog "${DOCKERHUB_IMAGE}:${TAG_NAME}"

docker push "${DOCKERHUB_IMAGE}:latest"
docker push "cyberark/parse-a-changelog:${TAG_NAME}"
