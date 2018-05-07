# ownCloud: Wordpress

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/wordpress/status.svg)](https://drone.owncloud.com/owncloud-docker/server)
[![](https://images.microbadger.com/badges/image/owncloud/wordpress.svg)](https://microbadger.com/images/owncloud/wordpress "Get your own image badge on microbadger.com")

This is our basic ownCloud website image that provides a basic Wordpress installation, it is based on our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/owncloud-docker/wordpress/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/owncloud/wordpress/tags/), these lists are always up to date. Please note that release candidates or alpha/beta versions are only temporary available, they will be removed after the final release of a version.


## Volumes

* /var/www/wordpress
* /mnt/data


## Ports

* 80
* 443


## Available environment variables

```
WORDPRESS_DOMAIN ${HOSTNAME}
WORDPRESS_DEBUG false
WORDPRESS_DB_PREFIX wp_
WORDPRESS_DB_HOST mariadb
WORDPRESS_DB_NAME wordpress
WORDPRESS_DB_USERNAME
WORDPRESS_DB_PASSWORD
WORDPRESS_DB_TIMEOUT 180
WORDPRESS_DB_FAIL true
WORDPRESS_MAIL_HOST mail.owncloud.com
WORDPRESS_MAIL_PORT
WORDPRESS_MAIL_USERNAME
WORDPRESS_MAIL_PASSWORD
WORDPRESS_MAIL_SECURITY ssl
WORDPRESS_MAIL_FROM norepy@owncloud.com
WORDPRESS_MAIL_NAME WordPress Admin
WORDPRESS_AUTH_KEY # Generated if not present
WORDPRESS_SECURE_AUTH_KEY # Generated if not present
WORDPRESS_LOGGED_IN_KEY # Generated if not present
WORDPRESS_NONCE_KEY # Generated if not present
WORDPRESS_AUTH_SALT # Generated if not present
WORDPRESS_SECURE_AUTH_SALT # Generated if not present
WORDPRESS_LOGGED_IN_SALT # Generated if not present
WORDPRESS_NONCE_SALT # Generated if not present
```

## Inherited environment variables

* [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#available-environment-variables)


## Build locally

The available versions should be already pushed to the Docker Hub, but in case you want to try a change locally you can always execute the following command (run from a cloned GitHub repository) to get an image built locally:

```
wget https://wordpress.org/wordpress-4.7.1.tar.gz

docker pull owncloud/ubuntu:latest
docker build -t owncloud/wordpress:latest .
```


### Launch with plain `docker`

The installation of `docker` is not covered by this instructions, please follow the [official installation instructions](https://docs.docker.com/engine/installation/). After the installation of docker you can continue with the required MariaDB container:

```bash
docker volume create wordpress_mysql
docker volume create wordpress_backup

docker run -d \
  --name mariadb \
  -e MARIADB_ROOT_PASSWORD=wordpress \
  -e MARIADB_USERNAME=wordpress \
  -e MARIADB_PASSWORD=wordpress \
  -e MARIADB_DATABASE=wordpress \
  --volume wordpress_mysql:/var/lib/mysql \
  --volume wordpress_backup:/var/lib/backup \
  webhippie/mariadb:latest
```

Then you can start the Wordpress web server, you can customize the used environment variables as needed, for the Wordpress version you can choose any of the available tags:

```bash
export WORDPRESS_VERSION=4.7.1
export WORDPRESS_DOMAIN=localhost
export HTTP_PORT=80
export HTTPS_PORT=443

docker volume create wordpress_files
docker volume create wordpress_htdocs

docker run -d \
  --name wordpress \
  --link mariadb:db \
  -p ${HTTP_PORT}:80 \
  -p ${HTTPS_PORT}:443 \
  -e WORDPRESS_DOMAIN=${WORDPRESS_DOMAIN} \
  -e WORDPRESS_DB_NAME=wordpress \
  -e WORDPRESS_DB_USERNAME=wordpress \
  -e WORDPRESS_DB_PASSWORD=wordpress \
  -e WORDPRESS_DB_HOST=db \
  --volume wordpress_files:/mnt/data \
  --volume wordpress_htdocs:/var/www/wordpress \
  owncloud/wordpress:${WORDPRESS_VERSION}
```


### Launch with `docker-compose`

The installation of `docker-compose` is not covered by these instructions, please follow the [official installation instructions](https://docs.docker.com/compose/install/). Be aware that you must install version `1.12.0+`. After the installation of `docker-compose` you can continue with the following commands to start the Wordpress stack. First we are defining some required environment variables, then we are downloading the required `docker-compose.yml` file. The `.env` and `docker-compose.yml` are expected in the current working directory, when running `docker-compose` commands, for the Wordpress version you can choose any of the available tags:

```bash
cat << EOF >| .env
WORDPRESS_VERSION=4.7.1
WORDPRESS_DOMAIN=localhost
HTTP_PORT=80
HTTPS_PORT=443
EOF

wget -O docker-compose.yml https://raw.githubusercontent.com/owncloud-docker/wordpress/master/docker-compose.yml

# Finally start the containers in the background
docker-compose up -d
```

More commands of interest (try adding `-h` for help):

```bash
docker-compose exec wordpress bash
docker-compose stop
docker-compose start
docker-compose down
docker-compose logs
```

By default `docker-compose up` will start MariaDB and Wordpress containers, the content gets stored in named volumes persistently. The container ports `80` and `443` are bound as configured in the `.env` file.

### Upgrade to newer version

In order to upgrade an existing container-based installation you just need to upgrade the Wordpress instance with the web-based updater since all files are persisted by the volumes.


### Custom certificates

By default we generate self-signed certificates on startup of the containers, you can replace the certificates with your own certificates. You can use `docker cp` to place them into the directory, e.g. `docker cp ssl-cert.crt $(docker-compose ps -q wordpress):/mnt/data/certs/` and `docker cp ssl-cert.key $(docker-compose ps -q wordpress):/mnt/data/certs/`.


### Accessing the Wordpress

By default you can access the Wordpress instance at [https://localhost/](https://localhost/) as long as you have not changed the port binding. Only for the first time you will see the regular Wordpress installation wizard.


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/wordpress/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)
* [Sarah Kriesch](https://github.com/skriesch)


## License

MIT


## Copyright

```
Copyright (c) 2018 Thomas Boerger <tboerger@owncloud.com>
```
