#!/bin/sh

if ! grep -q -F '_svscan_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _svscan_" >> /etc/rc.local
    echo "echo -n 'Starting svscan:'" >> /etc/rc.local
    echo "svscanboot /service &" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
			
mkdir -m 700 -p /service

cat /etc/rc.local |grep -v "csh -cf '/command/svscanboot &'" > /etc/rc.local.new
mv /etc/rc.local.new /etc/rc.local
