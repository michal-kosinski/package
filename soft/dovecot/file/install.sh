#!/bin/sh

if [ ! -x /var/run/dovecot/login ]; then
	mkdir -p /var/run/dovecot/login
fi

touch /var/log/dovecot.log

if ! grep -q -F '_dovecot_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _dovecot_" >> /etc/newsyslog.conf
    echo "/var/log/dovecot.log   root.wheel  600  10   1024  *     Z /var/run/dovecot/master.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_dovecot_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _dovecot_" >> /etc/rc.local
    echo "echo -n 'Starting dovecot:'" >> /etc/rc.local
    echo "/usr/sbin/dovecot" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

