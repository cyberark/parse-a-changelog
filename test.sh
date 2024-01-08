#!/usr/bin/env bash

set -eux

echo "==> Starting test.sh"

echo "==> Docker Run"

docker run --rm \
    --volume $PWD:/work \
    --workdir /work \
    cyberark/ubuntu-ruby-builder \
      bash -c 'git config --global \
      --add safe.directory /work && \
      bundle install && bundle exec rspec' 

echo "==> End of test.sh"