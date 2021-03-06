#!/usr/bin/env bash

declare -x WORDPRESS_DOMAIN
[[ -z "${WORDPRESS_DOMAIN}" ]] && WORDPRESS_DOMAIN="${HOSTNAME}"

declare -x WORDPRESS_DEBUG
[[ -z "${WORDPRESS_DEBUG}" ]] && WORDPRESS_DEBUG="false"

declare -x WORDPRESS_PRE_SERVER_PATH
[[ -z "${WORDPRESS_PRE_SERVER_PATH}" ]] && WORDPRESS_PRE_SERVER_PATH="/etc/pre_server.d"

declare -x WORDPRESS_POST_SERVER_PATH
[[ -z "${WORDPRESS_POST_SERVER_PATH}" ]] && WORDPRESS_POST_SERVER_PATH="/etc/post_server.d"

declare -x WORDPRESS_MAX_UPLOAD
[[ -z "${WORDPRESS_MAX_UPLOAD}" ]] && WORDPRESS_MAX_UPLOAD="20G"

declare -x WORDPRESS_MAX_EXECUTION_TIME
[[ -z "${WORDPRESS_MAX_EXECUTION_TIME}" ]] && WORDPRESS_MAX_EXECUTION_TIME="3600"

declare -x WORDPRESS_MAX_INPUT_TIME
[[ -z "${WORDPRESS_MAX_INPUT_TIME}" ]] && WORDPRESS_MAX_INPUT_TIME="3600"

declare -x WORDPRESS_SKIP_CHOWN
[[ -z "${WORDPRESS_SKIP_CHOWN}" ]] && WORDPRESS_SKIP_CHOWN="false"

declare -x WORDPRESS_CROND_ENABLED
[[ -z "${WORDPRESS_CROND_ENABLED}" ]] && WORDPRESS_CROND_ENABLED="true"

true
