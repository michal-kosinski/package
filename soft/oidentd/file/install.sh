#!/bin/sh

if ! grep -q -F '_oidentd_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _oidentd_" >> /etc/rc.local
    echo "echo -n 'Starting oidentd:'" >> /etc/rc.local
    echo "/usr/sbin/oidentd -u nobody -m" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

