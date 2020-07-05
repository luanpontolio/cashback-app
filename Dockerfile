FROM ruby:2.5.1-alpine3.7

RUN apk update && apk add --update build-base nodejs nodejs-npm tzdata postgresql-dev bash

ENV app_root /cashback-app
ENV RAILS_ENV production

WORKDIR ${app_root}

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

RUN bundle exec rake assets:precompile
RUN rm -rf log/* test/* tmp/cache/* tmp/pids/* tmp/sessions/* tmp/sockets/*

EXPOSE 3000

CMD bundle exec puma -C config/puma.rb
