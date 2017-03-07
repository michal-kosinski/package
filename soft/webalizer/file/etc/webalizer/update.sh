#!/bin/sh

for a in /etc/webalizer/*.conf
	do
		DIR=`cat $a|grep OutputDir|cut -d" " -f7`
		if [ ! -x $DIR ]; then
			echo "Directory $DIR not found! Making one..."
			mkdir -p $DIR && chown -R httpd.httpd $DIR
		fi
		webalizer -Q -c $a
	done

