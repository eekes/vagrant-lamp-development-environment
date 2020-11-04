#!/bin/bash

apt-get update
apt-get install -y unzip

debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $2"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $2"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $2"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"

apt-get install -y phpmyadmin

rm -rf /usr/share/phpmyadmin

cd /tmp
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-$1-all-languages.zip
unzip phpMyAdmin-$1-all-languages.zip
rm phpMyAdmin-$1-all-languages.zip
sudo mv phpMyAdmin-$1-all-languages /usr/share/phpmyadmin

sudo chown -R www-data:www-data /usr/share/phpmyadmin
sudo chmod -R 755 /usr/share/phpmyadmin

phpenmod mbstring
systemctl restart apache2