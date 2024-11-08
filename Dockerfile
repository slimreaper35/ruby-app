FROM registry.access.redhat.com/ubi9/ruby-31

COPY Gemfile .
COPY Gemfile.lock .

COPY . .

RUN bundle config list
RUN bundle install
RUN bundle list
