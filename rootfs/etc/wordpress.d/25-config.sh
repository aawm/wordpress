#!/usr/bin/env bash

echo "Creating mailer dir..."
mkdir -p /var/www/wordpress/wp-content/mu-plugins

echo "Copying mailer config..."
envsubst \
  '${WORDPRESS_MAIL_HOST} ${WORDPRESS_MAIL_PORT} ${WORDPRESS_MAIL_USERNAME} ${WORDPRESS_MAIL_PASSWORD} ${WORDPRESS_MAIL_SECURITY} ${WORDPRESS_MAIL_FROM} ${WORDPRESS_MAIL_NAME}' \
    < /root/wordpress/mailer.php > /var/www/wordpress/wp-content/mu-plugins/mailer.php

echo "Copying general config..."
envsubst \
  '${WORDPRESS_DB_PREFIX} ${WORDPRESS_DB_NAME} ${WORDPRESS_DB_USERNAME} ${WORDPRESS_DB_PASSWORD} ${WORDPRESS_DB_HOST} ${WORDPRESS_DEBUG} ${WORDPRESS_AUTH_KEY} ${WORDPRESS_SECURE_AUTH_KEY} ${WORDPRESS_LOGGED_IN_KEY} ${WORDPRESS_NONCE_KEY} ${WORDPRESS_AUTH_SALT} ${WORDPRESS_SECURE_AUTH_SALT} ${WORDPRESS_LOGGED_IN_SALT} ${WORDPRESS_NONCE_SALT}' \
    < /root/wordpress/config.php > /var/www/wordpress/wp-config.php

true
