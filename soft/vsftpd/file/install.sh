#!/bin/sh

mkdir -p /usr/share/empty

if ! grep -q -F '_vsftpd_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _vsftpd_" >> /etc/rc.local
    echo "echo -n 'Starting vsftpd:'" >> /etc/rc.local
    echo "vsftpd & 2>&1 1>/dev/null" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

