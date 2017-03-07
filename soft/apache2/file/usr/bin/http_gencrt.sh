#!/bin/sh

if [ "$1" = "" ]; then {
	echo "Use `hostname` for certificate generation? (y/n)"
	read USE
	if [ "$USE" = "y" ]; then {
		openssl genrsa -out /etc/http/ssl/`hostname`.key 1024
		openssl req -new -key /etc/http/ssl/`hostname`.key -out /etc/http/ssl/`hostname`.csr
		openssl x509 -req -days 3650 -in /etc/http/ssl/`hostname`.csr -signkey /etc/http/ssl/`hostname`.key -out /etc/http/ssl/`hostname`.crt
		exit
	}
	fi
}

else {
	openssl genrsa -out /etc/http/ssl/$1.key 1024
	openssl req -new -key /etc/http/ssl/$1.key -out /etc/http/ssl/$1.csr
	openssl x509 -req -days 3650 -in /etc/http/ssl/$1.csr -signkey /etc/http/ssl/$1.key -out /etc/http/ssl/$1.crt
}

fi

#openssl x509 -in *.crt -text -noout # view
