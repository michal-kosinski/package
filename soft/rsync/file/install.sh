#!/bin/sh

if [ ! -x /home/rsync/data ]; then
	mkdir -p -m 0700 /home/rsync/data
	chown -R nobody.nobody /home/rsync/
fi

if [ ! -r /var/log/rsyncd.log ]; then
	touch /var/log/rsyncd.log
	chmod 0600 /var/log/rsyncd.log
fi

if ! grep -q -F '_rsync_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _rsync_" >> /etc/newsyslog.conf
    echo "/var/log/rsyncd.log    root.wheel   600  10   1024  *     Z /var/run/rsyncd.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_rsync_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _rsync_" >> /etc/rc.local
    echo "echo -n 'Starting rsync:'" >> /etc/rc.local
    echo "/usr/bin/rsync --daemon --config=/etc/rsync/rsyncd.conf" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
