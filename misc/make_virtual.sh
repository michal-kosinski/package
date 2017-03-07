#!/bin/sh

if [ "$1" != "" ]; then

	if [ -x /home/www/www.$1 ]; then
		echo "www.$1 server already exist!"
		exit 0
	fi

	mkdir -p -m 770 /home/www/www.$1/{http,log}
	echo "<H1>www.$1 - strona testowa</H1>" > /home/www/www.$1/http/index.php
	chmod 770 /home/www/www.$1
	chown -R 200.200 /home/www/www.$1

	echo "php support? (4/5/n)"
	read PHP

echo "
<VirtualHost *:80>
	ServerName $1
        ServerAlias www.$1
        DocumentRoot /home/www/www.$1/http
        <Directory  /home/www/www.$1/http>
                AllowOverride All
        </Directory>
        ErrorLog /home/www/www.$1/log/error.log
        CustomLog /home/www/www.$1/log/access.log combined" >> /etc/http/virtual.conf

	if [ "$PHP" = 4 ]; then
	echo "        AddType application/x-httpd-php .php" >> /etc/http/virtual.conf
	fi

        if [ "$PHP" = 5 ]; then
        echo "        AddType application/x-httpd-php5 .php" >> /etc/http/virtual.conf
        fi

echo "</VirtualHost>" >> /etc/http/virtual.conf

	echo "Obsluga SSL? (y/n)"
	read SSL


	if [ "$SSL" = y ]; then 
echo "
<VirtualHost *:443>
	ServerName $1
	ServerAlias www.$1
	DocumentRoot /home/www/www.$1/http
	<Directory  /home/www/www.$1/http>
		AllowOverride All
	</Directory>
	ErrorLog /home/www/www.$1/log/error.log
	CustomLog /home/www/www.$1/log/access.log combined" >> /etc/http/virtual.conf

        if [ "$PHP" = 4 ]; then
        echo "        AddType application/x-httpd-php .php" >> /etc/http/virtual.conf
        fi

        if [ "$PHP" = 5 ]; then
        echo "        AddType application/x-httpd-php5 .php" >> /etc/http/virtual.conf
        fi

echo "	SSLCertificateFile /etc/http/ssl/`hostname`.crt
	SSLCertificateKeyFile /etc/http/ssl/`hostname`.key
	SSLEngine On
</VirtualHost>" >> /etc/http/virtual.conf
	fi

	echo "apachectl configtest? (y/n)"
	read T1

	if [ "$T1" = y ]; then
		apachectl configtest
	fi

	echo "apachectl graceful? (y/n)"
	read T2

	if [ "$T2" = y ]; then
        	apachectl graceful
		sleep 2
		apachectl start
	fi

else
        echo "Usage: $0 domain.com (no www prefix!)"
fi
