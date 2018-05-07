#!/usr/bin/env bash

if [[ ${WORDPRESS_SKIP_CHOWN} == "true" ]]
then
  echo "Skipping chown as requested..."
else
  echo "Fixing hook perms..."
  find ${WORDPRESS_PRE_SERVER_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x
  find ${WORDPRESS_POST_SERVER_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x

  echo "Fixing base perms..."
  find /var/www/wordpress \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data

  echo "Fixing data perms..."
  find ${WORDPRESS_VOLUME_ROOT} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data

  if [[ ! ${WORDPRESS_VOLUME_CERTS} =~ ^${WORDPRESS_VOLUME_ROOT} ]]
  then
    echo "Fixing cert perms..."
    find ${WORDPRESS_VOLUME_CERTS} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi

  if [[ ! ${WORDPRESS_VOLUME_SESSIONS} =~ ^${WORDPRESS_VOLUME_ROOT} ]]
  then
    echo "Fixing session perms..."
    find ${WORDPRESS_VOLUME_SESSIONS} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi
fi

true
