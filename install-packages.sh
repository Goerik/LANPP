#!/bin/bash

# System packages
aptitude install sharutils htop sudo mc

# Install mysql/percona
aptitude install percona-server-server percona-toolkit percona-xtrabackup percona-server-client

# Install php
aptitude install apache2-mpm-itk libapache2-mod-rpaf php5 libapache2-mod-php5 php5-mysql php5-snmp php5-gd php5-imagick php5-recode php5-xmlrpc php5-xsl php5-mcrypt php5-curl php-pear php5-imap php5-mysql php-apc

# Install nginx
aptitude install nginx-full

# Delete php5-suhosin module
aptitude purge php5-suhosin

# Enable mod_rewrite
a2enmod rewrite

apache2ctl restart

rm /etc/apache2/sites-enabled/*
rm /etc/nginx/sites-enabled/*

# Move apache port to local 127.0.0.1:8080
sed -i -e 's/80/8080/g' -e 's/NameVirtualHost \*/NameVirtualHost 127.0.0.1/g' /etc/apache2/ports.conf
apache2ctl restart
service nginx restart

#Copy MySQL/Percona config
cp /usr/share/mysql/my-medium.cnf /etc/mysql/my.cnf
service mysql restart
