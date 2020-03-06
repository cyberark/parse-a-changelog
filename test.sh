#!/usr/bin/env bash

set -eux

docker run \
    -v $PWD:/work \
    -w /work \
    ruby:2.6 \
        bash -c "gem install bundler --no-document; \
                 bundle install; \
                 bundle exec rspec"
