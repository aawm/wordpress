#!/usr/bin/env bash

echo "Writing apache config..."
envsubst \
  '${WORDPRESS_VOLUME_CERTS} ${WORDPRESS_ERRORLOG_LOCATION} ${WORDPRESS_ACCESSLOG_LOCATION}' \
    < /root/wordpress/apache.conf > /etc/apache2/sites-enabled/000-default.conf

echo "Writing php config..."
  envsubst \
    '${WORDPRESS_VOLUME_SESSIONS} ${WORDPRESS_MAX_UPLOAD} ${WORDPRESS_MAX_EXECUTION_TIME} ${WORDPRESS_MAX_INPUT_TIME}' \
      < /root/wordpress/php.ini > /etc/php/7.0/mods-available/wordpress.ini

if [[ ${WORDPRESS_CROND_ENABLED} == "true" ]]
then
  echo "Touching cron configs..."
  touch /etc/cron.d/*

  echo "Starting cron daemon..."
  service cron start >/dev/null
fi

if [[ -d "${WORDPRESS_PRE_SERVER_PATH}" ]]
then
  for FILE in $(find ${WORDPRESS_PRE_SERVER_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

echo "Starting apache daemon..."
service apache2 start >/dev/null

if [[ -d "${WORDPRESS_POST_SERVER_PATH}" ]]
then
  for FILE in $(find ${WORDPRESS_POST_SERVER_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

true
