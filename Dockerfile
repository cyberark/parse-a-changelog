FROM ruby:2.6

RUN gem install bundler

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without test development

COPY . .

CMD ["/bin/bash", "-c", "/usr/src/app/bin/parse $CHANGELOG_PATH"]