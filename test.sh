#!/usr/bin/env bash

set -eux

docker run \
    -v $PWD:/work \
    -w /work \
    ruby:3.1 \
        bash -c "git config --global --add safe.directory /work; \
                 gem install bundler --no-document; \
                 bundle install; \
                 bundle exec rspec"
