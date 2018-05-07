#!/usr/bin/env bash

if ! grep -q ":" <<<${WORDPRESS_DB_HOST}
then
  WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}:3306
fi

echo "Waiting for MySQL..."
wait-for-it -t ${WORDPRESS_DB_TIMEOUT} ${WORDPRESS_DB_HOST}

if [[ $? -ne 0 && "${WORDPRESS_DB_FAIL}" == "true" ]]
then
  echo "Database didn't came up in time!"
  exit 1
fi

true
