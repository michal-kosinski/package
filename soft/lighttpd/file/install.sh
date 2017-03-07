#!/bin/sh

touch /var/log/{lighttpd.error.log,lighttpd.access.log}
chown httpd.httpd /var/log/{lighttpd.error.log,lighttpd.access.log}
chmod 644 /var/log/{lighttpd.error.log,lighttpd.access.log}

if [ -x /tmp/lighttpd/cache/compress ]; then
	mkdir -p /tmp/lighttpd/cache/compress
	chown httpd.httpd /tmp/lighttpd/cache/compress
fi

# echo "cgi.fix_pathinfo = 1" >> /etc/php5/php.ini

if ! grep -q -F '_lighttp_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _lighttp_" >> /etc/newsyslog.conf
    echo "/var/log/lighttpd.access.log   httpd.httpd  600  10   1024  *     Z /var/run/lighttpd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "/var/log/lighttpd.error.log    httpd.httpd  600  10   1024  *     Z /var/run/lighttpd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
fi

if ! grep -q -F '_lighttp_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _lighttp_" >> /etc/rc.local
    echo "echo -n 'Starting lighttp:'" >> /etc/rc.local
    echo "lighttpd -f /etc/lighttp/lighttpd.conf" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
