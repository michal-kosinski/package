#!/bin/sh

cat /etc/mysql/my-medium.cnf|egrep -v "#|^$" > /etc/mysql/my.cnf
cd /etc && ln -sf mysql/my.cnf

if [ ! -x /usr/mysql/ ]; then

	mkdir -p /usr/mysql/data
	chown -R mysql.mysql /usr/mysql

	sh /usr/bin/mysql_install_db

	chown -R mysql.mysql /usr/mysql

	touch /var/log/mysql.log
	touch /var/log/mysql-slow.log

	chown mysql.mysql /var/log/mysql.log
	chmod 600 /var/log/mysql.log

	chown mysql.mysql /var/log/mysql-slow.log
	chmod 600 /var/log/mysql-slow.log

	mysqld_safe 2>&1 >/dev/null --log-error=/var/log/mysql.log --log-slow-queries=/var/log/mysql-slow.log --skip-name-resolve --skip-host-cache --open-files-limit=2048 &
	sleep 5
	HOSTNAME=`hostname`
	MYSQLPASS=`md5 -s "mysql.$HOSTNAME"`
	echo "Setting password for MySQL root account to: $MYSQLPASS"
	mysqladmin -u root password "$MYSQLPASS"

fi

if ! grep -q -F '_mysql_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _mysql_" >> /etc/rc.local
    echo "echo -n 'Starting mysql:'" >> /etc/rc.local
    echo "mysqld_safe 2>&1 >/dev/null --log-error=/var/log/mysql.log --log-slow-queries=/var/log/mysql-slow.log --skip-name-resolve --skip-host-cache --open-files-limit=2048 &" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

if ! grep -q -F '_mysql_' /etc/rc.shutdown; then
    echo "" >> /etc/rc.shutdown
    echo "# _mysql_" >> /etc/rc.shutdown
    echo "if [ -f /usr/mysql/data/`hostname`.pid ]; then" >> /etc/rc.shutdown
    echo "      mysqladmin shutdown" >> /etc/rc.shutdown
    echo "      rm -f /usr/mysql/data/`hostname`.pid" >> /etc/rc.shutdown
    echo "fi" >> /etc/rc.shutdown
    echo "" >> /etc/rc.shutdown
fi

if ! grep -q -F '_mysql_' /etc/newsyslog.conf; then
    echo "# _mysql_" >> /etc/newsyslog.conf
    echo "/var/log/mysql.log          mysql.mysql 600  10   1    *     Z \"mysqladmin flush-logs\"" >> /etc/newsyslog.conf
    echo "/var/log/mysql-slow.log     mysql.mysql 600  10   1    *     Z \"mysqladmin flush-logs\"" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi
