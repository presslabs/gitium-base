#!/bin/sh
set -e
mkdir -p /vagrant/log
adduser vagrant www-data
export DEBIAN_FRONTEND=noninteractive

echo "Adding pacakges repositories"
cat <<EOF > /etc/apt/sources.list.d/php7.1.list
deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
EOF
apt-key adv -q --keyserver keyserver.ubuntu.com --recv-keys 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C 2>&1 > /dev/null

cat <<EOF > /etc/apt/sources.list.d/nginx.list
deb http://nginx.org/packages/ubuntu/ xenial nginx
EOF
wget -q -O- http://nginx.org/keys/nginx_signing.key | apt-key add - > /dev/null

echo "Preconfiguring packages"
cat << EOF > /root/.my.cnf
[client]
    user=root
    password=vagrant
EOF

echo 'mysql-server-5.7 mysql-server/root_password password vagrant' | debconf-set-selections
echo 'mysql-server-5.7 mysql-server/root_password_again password vagrant' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password vagrant' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password vagrant' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password vagrant' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections


echo "Installing system pacakges"
apt-get update -qy > /dev/null
apt-get -o Dpkg::Options::="--force-confold" install -qy nginx php7.1-bcmath="7.1*" php7.1-cli="7.1*" php7.1-curl="7.1*"  php7.1-fpm="7.1*" php7.1-gd="7.1*" php7.1-imap="7.1*" php7.1-json="7.1*" php7.1-mbstring="7.1*" php7.1-mysql="7.1*" php7.1-xml="7.1*" php7.1-zip="7.1*" php7.1-soap="7.1*" php7.1-mcrypt="7.1*" php7.1="7.1*" php-geoip php-imagick php-memcached mysql-server-5.7 build-essential avahi-daemon > /dev/null
apt-get -o Dpkg::Options::="--force-confold" install -qy phpmyadmin > /dev/null

echo "Configuring system"

rm -rf /etc/nginx
cp -r /vagrant/provision/nginx /etc/nginx

rm -f /etc/php/7.1/fpm/pool.d/www.conf
cat <<EOF >/etc/php/7.1/fpm/pool.d/vagrant.conf
[vagrant]

prefix = /vagrant/
user = vagrant
group = vagrant
listen = /var/run/php7.1-vagrant.sock
listen.owner = vagrant
listen.group = vagrant
listen.mode = 0660
pm = static
pm.max_children = 5
pm.max_requests = 500
pm.status_path = /gitium/fpm-status
ping.path = /gitium/fpm-ping
env[ENV] = vagrant

access.log = /vagrant/log/php-access.log
access.format = "%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%%"
EOF
cp /vagrant/provision/php.ini /etc/php/7.1/fpm/php.ini

echo "Creating 'wordpress' database"
echo 'create database if not exists `wordpress`' | mysql
echo 'create database if not exists `wordpress_test`' | mysql

cp /vagrant/provision/wp-config.php /vagrant/wp-config.php

service nginx restart
service php7.1-fpm restart

