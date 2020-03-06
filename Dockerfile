FROM ruby:2.6

RUN gem install bundler --no-document

RUN bundle config set without 'test development'

WORKDIR /usr/src/app

COPY . .

RUN bundle install

ENTRYPOINT ["bundle", "exec", "bin/parse"]
CMD ["/CHANGELOG.md"]
