ARG PHP_VERSION=8.1
ARG PHP_SAPI=cli

FROM php:${PHP_VERSION}-${PHP_SAPI}-buster as php

COPY php/xdebug.sh /

RUN apt-get update && apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install bcmath zip \
  && /xdebug.sh ${PHP_VERSION} \
  && docker-php-ext-enable bcmath zip xdebug \
  && rm -rf /var/lib/apt/lists/*

COPY php/99-xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini
COPY php/98-error_reporting.ini /usr/local/etc/php/conf.d/98-error_reporting.ini

WORKDIR /app

FROM php as php-composer

COPY --from=composer /usr/bin/composer /usr/bin/composer