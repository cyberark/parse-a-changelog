FROM ruby:3-alpine

# We use git in the Gemspec file
RUN apk update && apk add --no-cache git

RUN gem install bundler --no-document

RUN bundle config set without 'test development'

WORKDIR /usr/src/app

COPY . .

RUN bundle install

ENTRYPOINT ["bundle", "exec", "bin/parse"]
CMD ["/CHANGELOG.md"]
