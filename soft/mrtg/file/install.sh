#!/bin/sh

if ! grep -q -F '_mrtg_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _mrtg_" >> /etc/rc.local
    echo "echo -n 'Starting mrtg:'" >> /etc/rc.local
    echo "/usr/bin/mrtg /etc/mrtg.cfg --logging /var/log/mrtg.log" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

# install net-snmpd: cd /usr/ports/net/net-snmp && make install
# install net-snmpd: pkg_add ftp://ftp.openbsd.org/pub/OpenBSD/3.9/packages/i386/net-snmp-5.1.3p2.tgz

echo "Ready to config MRTG for LocalCommunity@localhost"
echo "MRTG output in /home/www/`hostname`/http/mrtg"
echo "Config MRTG (y/n)?"
read CFGMAKE

if [ $CFGMAKE = "y" ]; then
	cfgmaker LocalCommunity@localhost > /etc/mrtg.cfg
	mkdir -p /home/www/`hostname`/http/mrtg
	indexmaker --title="MRTG @ `hostname`" /etc/mrtg.cfg > /home/www/`hostname`/http/mrtg/index.html
fi
