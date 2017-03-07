#!/bin/sh

echo "
application/rar                 rar
application/msi                 msi" >> /etc/http/mime.types

rm -rf /var/www/htdocs/*

mkdir -p -m 755 /home/www
mkdir -p -m 700 /var/log/http

chown -R httpd.httpd /home/www
chown -R httpd.httpd /var/log/http

chmod 755 /etc/http

if ! grep -q -F '_http_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _http_" >> /etc/newsyslog.conf
    echo "/var/log/http/access.log   httpd.httpd  600  10   1024  *     Z /var/run/httpd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "/var/log/http/error.log    httpd.httpd  600  10   1024  *     Z /var/run/httpd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "/var/log/http/ssl.log      httpd.httpd  600  10   1024  *     Z /var/run/httpd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_http_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _http_" >> /etc/rc.local
    echo "echo -n 'Starting httpd:'" >> /etc/rc.local
    echo "apachectl start 1>/dev/null" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

if ! grep -q -F 'httpd' /var/cron/cron.deny; then
        echo httpd >> /var/cron/cron.deny
fi

if ! grep -q -F 'httpd' /var/cron/at.deny; then
        echo httpd >> /var/cron/at.deny
fi

