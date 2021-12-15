#!/bin/sh
set -e

export RAILS_ENV="development"

bundle exec rake db:drop db:create db:migrate db:seed

bundle exec rails s -b 0.0.0.0
