#!/usr/bin/env bash

declare -x WORDPRESS_AUTH_KEY
[[ -z "${WORDPRESS_AUTH_KEY}" ]] && WORDPRESS_AUTH_KEY=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_SECURE_AUTH_KEY
[[ -z "${WORDPRESS_SECURE_AUTH_KEY}" ]] && WORDPRESS_SECURE_AUTH_KEY=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_LOGGED_IN_KEY
[[ -z "${WORDPRESS_LOGGED_IN_KEY}" ]] && WORDPRESS_LOGGED_IN_KEY=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_NONCE_KEY
[[ -z "${WORDPRESS_NONCE_KEY}" ]] && WORDPRESS_NONCE_KEY=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_AUTH_SALT
[[ -z "${WORDPRESS_AUTH_SALT}" ]] && WORDPRESS_AUTH_SALT=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_SECURE_AUTH_SALT
[[ -z "${WORDPRESS_SECURE_AUTH_SALT}" ]] && WORDPRESS_SECURE_AUTH_SALT=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_LOGGED_IN_SALT
[[ -z "${WORDPRESS_LOGGED_IN_SALT}" ]] && WORDPRESS_LOGGED_IN_SALT=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

declare -x WORDPRESS_NONCE_SALT
[[ -z "${WORDPRESS_NONCE_SALT}" ]] && WORDPRESS_NONCE_SALT=$(head -c1M /dev/urandom | sha1sum | cut -d' ' -f1)

true
