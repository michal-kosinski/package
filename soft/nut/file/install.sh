#!/bin/sh

mkdir -p /var/state/ups
chmod 0700 /var/state/ups
chown nut:nut /var/state/ups

chown root:nut /etc/{upsd.conf,upsd.users,upsmon.conf}
chmod 0640 /etc/{upsd.conf,upsd.users,upsmon.conf}

chmod 0600 /dev/tty00
chown nut:nut /dev/tty00

if ! grep -q -F '_nut_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _nut_" >> /etc/rc.local
    echo "echo -n 'Starting nut:'" >> /etc/rc.local
    echo "/usr/bin/upsdrvctl start" >> /etc/rc.local
    echo "/usr/sbin/upsd" >> /etc/rc.local
    echo "/usr/sbin/upsmon" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
