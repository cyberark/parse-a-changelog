#!/usr/bin/env bash

set -eux

docker run \
    -v $PWD:/work \
    -w /work \
    ruby:3.1 \
        bash -c "gem install bundler --no-document; \
                 bundle install; \
                 bundle exec rspec"
