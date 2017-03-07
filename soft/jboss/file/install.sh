#!/bin/sh

touch /var/log/jboss.log
chown jboss.jboss /var/log/jboss.log
chmod 0644 /var/log/jboss.log

if ! grep -q -F '_jboss_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _jboss_" >> /etc/rc.local
    echo "echo -n 'Starting JBoss:'" >> /etc/rc.local
    echo "sh /etc/rc.jboss start" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
