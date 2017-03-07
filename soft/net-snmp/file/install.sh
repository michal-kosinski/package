#!/bin/sh

if ! grep -q -F '_snmpd_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _snmpd_" >> /etc/rc.local
    echo "echo -n 'Starting snmpd:'" >> /etc/rc.local
    echo "/usr/sbin/snmpd" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

