FROM owncloud/ubuntu:latest

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="ownCloud Wordpress" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

VOLUME ["/mnt/data", "/var/www/wordpress"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/wordpress"]

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php-gd \
    php-mysql \
    php-curl \
    php-intl \
    php-mcrypt \
    php-imagick \
    php-zip \
    php-xml \
    php-mbstring \
    php-soap \
    php-apcu \
    php-opcache \
    php-ldap \
    php-imap \
    mysql-client \
    gettext-base \
    git-core && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/apache2/sites-available/default-ssl.conf && \
  a2enmod rewrite headers env dir mime ssl expires && \
  mkdir -p /var/www/wordpress /mnt/data/certs /mnt/data/sessions && \
  chown -R www-data:www-data /var/www/wordpress /mnt/data && \
  chsh -s /bin/bash www-data

ADD wordpress-*.tar.gz /usr/src/

COPY rootfs /
WORKDIR /var/www/wordpress
