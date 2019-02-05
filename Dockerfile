FROM ruby:2.6.0-alpine3.8

RUN apk add --no-cache \
  build-base \
  linux-headers \
  mysql-dev \
  nodejs \
  yarn \
  tzdata \
  git \
  less \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY Gemfile* /app/
ENV BUNDLE_JOBS=4
RUN bundle install

WORKDIR /app
COPY package*.json /app/
RUN yarn install

WORKDIR /app
COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
