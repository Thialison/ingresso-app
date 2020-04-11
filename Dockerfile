FROM ruby:2.6.3

ARG BS_USER_NAME
ARG BS_ACCESS_KEY
ARG BS_APP_PATH

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /ingresso-app
WORKDIR /ingresso-app

COPY Gemfile /ingresso-app/Gemfile
COPY Gemfile.lock /ingresso-app/Gemfile.lock

RUN bundle install
COPY . /ingresso-app