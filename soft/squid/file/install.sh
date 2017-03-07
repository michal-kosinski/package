#!/bin/sh

if [ ! -x /var/cache/squid ]; then
	mkdir -p /var/cache/squid
	chown -R squid.squid /var/cache/squid && chmod 700 /var/cache/squid
	squid -z
fi

if [ ! -x /var/log/squid ]; then
	mkdir -p /var/log/squid
	touch /var/log/squid/access.log /var/log/squid/cache.log
	chown -R squid.squid /var/log/squid && chmod 700 /var/log/squid
fi

echo "visible_hostname `hostname`" >> /etc/squid.conf

chown squid.squid /etc/squid.conf && chmod 600 /etc/squid.conf
chown squid.squid /etc/mime.conf && chmod 600 /etc/mime.conf

if ! grep -q -F '_squid_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _squid_" >> /etc/newsyslog.conf
    echo "/var/log/squid/access.log  squid.squid  600  7    *    24    Z \"squid -k rotate\"" >> /etc/newsyslog.conf
    echo "/var/log/squid/cache.log   squid.squid  600  7    *    24    Z \"squid -k rotate\"" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_squid_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _squid_" >> /etc/rc.local
    echo "echo -n 'Starting squid:'" >> /etc/rc.local
    echo "squid -D 1>/dev/null" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
		    
