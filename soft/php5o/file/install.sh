#!/bin/sh

if [ ! -x /var/log/php ]; then
	mkdir -p -m 755 /var/log/php
	chown -R httpd.httpd /var/log/php
fi

chown -R root.wheel /etc/php5
find /etc -name "php5" -type d -exec chmod 755 {} \;
find /etc -name "php5" -type f -exec chmod 644 {} \;

if ! grep -q -F '_php5_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _php5_" >> /etc/newsyslog.conf
    echo "/var/log/php/php5_error.log   httpd.httpd  600  10   1024  *     Z /var/run/httpd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi
