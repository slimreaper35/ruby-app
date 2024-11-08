FROM docker.io/ruby:3.3

COPY Gemfile .
COPY Gemfile.lock .

COPY . .

RUN bundle config list
RUN bundle install --local
RUN bundle list
