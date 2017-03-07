#!/bin/sh

echo "
# _arp permanent_
if [ -s /etc/arp.permanent ]; then
        echo -n 'Setting permanent ARP entries:\\\n'
        /usr/sbin/arp -d -a && /usr/sbin/arp -f /etc/arp.permanent
fi

# _reboot_
date >> /var/log/reboot.log" >> /etc/rc.local
