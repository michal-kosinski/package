#!/bin/sh

if ! grep -q -F '_memcached_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _memcached_" >> /etc/rc.local
    echo "echo -n 'Starting memcached:'" >> /etc/rc.local
    echo "memcached -l 127.0.0.1 -p 11211 -u nobody -m 1024 -d" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
