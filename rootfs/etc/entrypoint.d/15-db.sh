#!/usr/bin/env bash

declare -x WORDPRESS_DB_PREFIX
[[ -z "${WORDPRESS_DB_PREFIX}" ]] && WORDPRESS_DB_PREFIX="wp_"

declare -x WORDPRESS_DB_HOST
[[ -z "${WORDPRESS_DB_HOST}" ]] && WORDPRESS_DB_HOST="mariadb"

declare -x WORDPRESS_DB_NAME
[[ -z "${WORDPRESS_DB_NAME}" ]] && WORDPRESS_DB_NAME="wordpress"

declare -x WORDPRESS_DB_USERNAME
[[ -z "${WORDPRESS_DB_USERNAME}" ]] && WORDPRESS_DB_USERNAME=""

declare -x WORDPRESS_DB_PASSWORD
[[ -z "${WORDPRESS_DB_PASSWORD}" ]] && WORDPRESS_DB_PASSWORD=""

declare -x WORDPRESS_DB_TIMEOUT
[[ -z "${WORDPRESS_DB_TIMEOUT}" ]] && WORDPRESS_DB_TIMEOUT="180"

declare -x WORDPRESS_DB_FAIL
[[ -z "${WORDPRESS_DB_FAIL}" ]] && WORDPRESS_DB_FAIL="true"

declare -x WORDPRESS_DB_WAITING
[[ -z "${WORDPRESS_DB_WAITING}" ]] && WORDPRESS_DB_WAITING="true"

true
