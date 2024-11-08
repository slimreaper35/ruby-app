FROM docker.io/library/ruby:latest

COPY Gemfile .
COPY Gemfile.lock .

COPY . .

RUN bundle config list
RUN bundle install
RUN bundle list
