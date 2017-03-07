#!/bin/sh

if ! grep -q -F '_portsentry_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _portsentry_" >> /etc/rc.local
    echo "echo -n 'Starting portsentry:'" >> /etc/rc.local
    echo "portsentry -tcp" >> /etc/rc.local
    echo "portsentry -udp" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

