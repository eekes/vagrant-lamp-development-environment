#!/bin/bash

apt-get install software-properties-common
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y \
  php$1 \
  php$1-bcmath \
  php$1-bz2 \
  php$1-cli \
  php$1-curl \
  php$1-intl \
  php$1-json \
  php$1-mbstring \
  php$1-opcache \
  php$1-soap \
  php$1-xml \
  php$1-xsl \
  php$1-zip \
  libapache2-mod-php$1 \
  php$1-mysql \
  php$1-imagick \
  php$1-gd \
  php$1-gettext \
  php$1-xmlrpc \
  imagemagick

sed -i 's/max_execution_time = .*/max_execution_time = 60/' /etc/php/$1/apache2/php.ini
sed -i 's/post_max_size = .*/post_max_size = 64M/' /etc/php/$1/apache2/php.ini
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 1G/' /etc/php/$1/apache2/php.ini
sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/$1/apache2/php.ini
sed -i 's/display_errors = .*/display_errors = on/' /etc/php/$1/apache2/php.ini
sed -i 's/display_startup_errors = .*/display_startup_errors = on/' /etc/php/$1/apache2/php.ini

service apache2 restart