#!/bin/sh

mkdir -p /var/log/proftpd
touch /var/log/proftpd/auth.log
touch /var/log/proftpd/access.log
touch /var/log/proftpd/transfer.log

chown -R ftp.ftp /var/log/proftpd
chmod -R 600 /var/log/proftpd
chmod 700 /var/log/proftpd

if ! grep -q -F '_proftpd_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _proftpd_" >> /etc/newsyslog.conf
    echo "/var/log/proftpd/access.log       ftp.ftp  600  10   1024  *     Z /var/run/proftpd.pid SIGHUP" >> /etc/newsyslog.conf
    echo "/var/log/proftpd/auth.log         ftp.ftp  600  10   1024  *     Z /var/run/proftpd.pid SIGHUP" >> /etc/newsyslog.conf
    echo "/var/log/proftpd/transfer.log     ftp.ftp  600  10   1024  *     Z /var/run/proftpd.pid SIGHUP" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi
			
if ! grep -q -F '_proftpd_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _proftpd_" >> /etc/rc.local
    echo "echo -n 'Starting proftpd:'" >> /etc/rc.local
    echo "proftpd 2>&1 1>/dev/null" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
						
						
						
