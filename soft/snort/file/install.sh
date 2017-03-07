#!/bin/sh

mkdir -p -m 700 /var/log/snort

mkdir -p /etc/snort
wget -q http://www.bleedingsnort.com/bleeding.rules.tar.gz -O bleeding.rules.tar.gz
wget -q http://www.snort.org/pub-bin/downloads.cgi/Download/comm_rules/Community-Rules-2.4.tar.gz -O Community-Rules-2.4.tar.gz
tar zxf bleeding.rules.tar.gz -C /etc/snort
tar zxf Community-Rules-2.4.tar.gz -C /etc/snort
rm -f bleeding.rules.tar.gz Community-Rules-2.4.tar.gz

rm -f /etc/snort/Makefile*

if ! grep -q -F '_snort_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _snort_" >> /etc/rc.local
    echo "echo -n 'Starting snort:'" >> /etc/rc.local
    echo "/usr/bin/snort -D -c /etc/snort/snort.conf" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
