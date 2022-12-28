#!/usr/bin/env bash

set -ex

PHP_VERSION=$(echo "$1" | awk -F"." '{ print $1 }')

if [[ $PHP_VERSION -lt 8 ]]; then
  pecl install xdebug-2.9.8
else
  pecl install xdebug
fi