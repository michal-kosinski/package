#!/bin/sh

PACKAGE_DIR="/usr/package"

groupadd -g 200 httpd 2>/dev/null
useradd -u 200 -g 200 -s /sbin/nologin -d '' httpd 2>/dev/null

groupadd -g 201 squid 2>/dev/null
useradd -u 201 -g 201 -s /sbin/nologin -d '' squid 2>/dev/null

groupadd -g 202 postgres 2>/dev/null
useradd -u 202 -g 202 -s /sbin/nologin -d '' postgres 2>/dev/null

groupadd -g 203 samba 2>/dev/null
useradd -u 203 -g 203 -s /sbin/nologin -d '' samba 2>/dev/null

groupadd -g 204 ftp 2>/dev/null
useradd -u 204 -g 204 -s /sbin/nologin -d '' ftp 2>/dev/null

groupadd -g 205 mysql 2>/dev/null
useradd -u 205 -g 205 -s /sbin/nologin -d '' mysql 2>/dev/null

groupadd -g 206 nagios 2>/dev/null
useradd -u 206 -g 206 -s /sbin/nologin -d '' nagios 2>/dev/null

groupadd -g 207 jboss 2>/dev/null
useradd -u 207 -g 207 -s /sbin/nologin -d '' jboss 2>/dev/null

groupadd -g 208 mailman 2>/dev/null
useradd -u 208 -g 208 -s /sbin/nologin -d '' mailman 2>/dev/null

groupadd -g 209 nut 2>/dev/null
useradd -u 209 -g 209 -s /sbin/nologin -d '' nut 2>/dev/null

groupadd -g 210 dovecot 2>/dev/null
useradd -u 210 -g 210 -s /sbin/nologin -d '' dovecot 2>/dev/null

groupadd -g 300 qmail 2>/dev/null
groupadd -g 301 nofiles 2>/dev/null

useradd -u 300 -g 301 -d /var/qmail/alias -s /sbin/nologin alias 2>/dev/null
useradd -u 301 -g 301 -d /var/qmail -s /sbin/nologin qmaild 2>/dev/null
useradd -u 302 -g 301 -d /var/qmail -s /sbin/nologin qmaill 2>/dev/null
useradd -u 303 -g 301 -d /var/qmail -s /sbin/nologin qmailp 2>/dev/null
useradd -u 304 -g 300 -d /var/qmail -s /sbin/nologin qmailq 2>/dev/null
useradd -u 305 -g 300 -d /var/qmail -s /sbin/nologin qmailr 2>/dev/null
useradd -u 306 -g 300 -d /var/qmail -s /sbin/nologin qmails 2>/dev/null


echo "Run configure scripts? (y/n)"
read CONFIRM

if [ "$CONFIRM" = "y" ]; then 
	for a in $PACKAGE_DIR/misc/configure_*.sh
	do
		/bin/sh $a
	done
fi
