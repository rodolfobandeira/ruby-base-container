FROM ruby:2.7-alpine3.13 as base

ENV NODE_ENV production
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV APP_HOME=/app
ENV BUNDLER_VERSION "2.3.8"
ENV PATH=$APP_HOME/bin:$PATH

# Set local timezone
RUN apk upgrade && apk add --update tzdata && \
    cp /usr/share/zoneinfo/Canada/Eastern /etc/localtime && \
    echo "Canada/Eastern" > /etc/timezone

RUN apk update && \
    apk add --no-cache \
    build-base \
    gcc \
    bash \
    cmake \
    git \
    nodejs \
    yarn \
    mariadb-dev \
    openssl-dev \
    && rm -rf /root/.cache \
    && rm -rf /var/cache/apk/*
