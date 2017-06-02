FROM ruby:2.4.1-slim

RUN mkdir /checkout
WORKDIR /checkout
ADD Gemfile /checkout/Gemfile
RUN touch /checkout/Gemfile.lock
RUN bundle install
ADD . /checkout

ENTRYPOINT ["bundle", "exec"]
