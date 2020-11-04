#!/bin/bash

apt-get install -y curl git

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

sudo composer self-update $1