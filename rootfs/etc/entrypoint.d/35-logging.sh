#!/usr/bin/env bash

declare -x WORDPRESS_ACCESSLOG_LOCATION
[[ -z "${WORDPRESS_ACCESSLOG_LOCATION}" ]] && WORDPRESS_ACCESSLOG_LOCATION="/var/log/apache2/access.log"

declare -x WORDPRESS_ACCESSLOG_DESTINATION
[[ -z "${WORDPRESS_ACCESSLOG_DESTINATION}" ]] && WORDPRESS_ACCESSLOG_DESTINATION="stdout"

declare -x WORDPRESS_ERRORLOG_LOCATION
[[ -z "${WORDPRESS_ERRORLOG_LOCATION}" ]] && WORDPRESS_ERRORLOG_LOCATION="/var/log/apache2/error.log"

declare -x WORDPRESS_ERRORLOG_DESTINATION
[[ -z "${WORDPRESS_ERRORLOG_DESTINATION}" ]] && WORDPRESS_ERRORLOG_DESTINATION="stderr"

true
