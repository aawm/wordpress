#!/usr/bin/env bash

if [[ ! -f /var/www/wordpress/index.php ]]
then
  echo "Installing wordpress sources..."
  pushd /var/www/wordpress >/dev/null
    tar cf - --one-file-system -C /usr/src/wordpress . | tar xf -
  popd >/dev/null
fi

true
