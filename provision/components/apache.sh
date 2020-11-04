#!/bin/bash

apt-get update
apt-get install -y apache2

yes | cp /var/www/provision/config/apache/vhosts/local.conf /etc/apache2/sites-available/
yes | cp /var/www/provision/config/ssl/* /etc/apache2/sites-available/

a2ensite local.conf
a2dissite 000-default

a2enmod rewrite
sudo service apache2 restart

rm -rf /var/www/html

sudo a2enmod ssl
sudo service apache2 restart