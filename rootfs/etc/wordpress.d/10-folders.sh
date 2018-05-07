#!/usr/bin/env bash

echo "Creating volume folders..."
mkdir -p \
  ${WORDPRESS_VOLUME_CERTS} \
  ${WORDPRESS_VOLUME_SESSIONS}

echo "Creating hook folders..."
mkdir -p \
  ${WORDPRESS_PRE_SERVER_PATH} \
  ${WORDPRESS_POST_SERVER_PATH}

true
