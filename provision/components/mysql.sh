#!/bin/bash

apt-get update

debconf-set-selections <<< "mysql-server mysql-server/root_password password $3"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $3"

apt-get -y install mysql-server-$1

CMD="sudo mysql -uroot -p$3 -e"

$CMD "CREATE DATABASE IF NOT EXISTS $4"
$CMD "GRANT ALL PRIVILEGES ON $4.* TO '$2'@'%' IDENTIFIED BY '$3';"
$CMD "CREATE DATABASE IF NOT EXISTS $4_test"
$CMD "GRANT ALL PRIVILEGES ON $4_TEST.* TO '$2'@'%' IDENTIFIED BY '$3';"
$CMD "FLUSH PRIVILEGES;"

sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
grep -q "^sql_mode" /etc/mysql/mysql.conf.d/mysqld.cnf || echo "sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" >> /etc/mysql/mysql.conf.d/mysqld.cnf

service mysql restart