FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /speedio_api

WORKDIR /speedio_api

ADD Gemfile /speedio_api/Gemfile

ADD Gemfile.lock /speedio_api/Gemfile.lock

RUN bundle install

ADD . /speedio_api