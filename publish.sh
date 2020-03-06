#!/usr/bin/env bash

set -eux

# Image created by https://github.com/conjurinc/publish-rubygem
docker pull registry.tld/conjurinc/publish-rubygem

summon --yaml "RUBYGEMS_API_KEY: !var rubygems/api-key" \
  docker run --rm --env-file @SUMMONENVFILE -v "$(pwd)":/opt/src \
  registry.tld/conjurinc/publish-rubygem parse_a_changelog
