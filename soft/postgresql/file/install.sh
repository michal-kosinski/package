#!/bin/sh

touch /var/log/pgsql.log
chown -R postgres.postgres /var/log/pgsql.log
chmod -R 600 /var/log/pgsql.log

if [ ! -x /usr/pgsql/ ]; then

mkdir -p /usr/pgsql
chown -R postgres.postgres /usr/pgsql
chmod -R 700 /usr/pgsql
sudo -u postgres /usr/bin/initdb -D /usr/pgsql

FILE=/usr/pgsql/postgresql.conf
TMP=`mktemp /tmp/_replace.XXXXXXXXXX`
cat $FILE \
 | sed s/'#tcpip_socket = false'/'tcpip_socket = true'/g \
 | sed s/'#unix_socket_permissions = 0777'/'unix_socket_permissions = 0700'/g \
 | sed s/'#default_with_oids = off'/'default_with_oids = on'/g \
> $TMP
mv $TMP $FILE

chown postgres.postgres $FILE
chmod 640 $FILE
  
FILE=/usr/pgsql/pg_hba.conf
TMP=`mktemp /tmp/_replace.XXXXXXXXXX`
cat $FILE \
 | sed s/'local   all         all                                             trust'/'local   all         postgres                                        trust'/g \
 | sed s/'host    all         all         127.0.0.1         255.255.255.255   trust'/'host    all         all         127.0.0.1         255.255.255.255   md5'/g \
> $TMP
mv $TMP $FILE

chown postgres.postgres $FILE
chmod 640 $FILE

sudo -u postgres /usr/bin/pg_ctl -w -p /usr/bin/postmaster -D /usr/pgsql -l /var/log/pgsql.log start
sleep 5
HOSTNAME=`hostname`
PGSQLPASS=`md5 -s "pgsql.$HOSTNAME"`
echo "Setting password for PostgreSQL root account to: $PGSQLPASS"
psql template1 postgres -c "ALTER USER postgres ENCRYPTED PASSWORD '$PGSQLPASS';"

fi

if ! grep -q -F '_postgres_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _postgres_" >> /etc/newsyslog.conf
    echo "/var/log/pgsql.log    postgres.postgres 600  10   1024  *     Z \"sudo -u postgres /usr/bin/pg_ctl -w -p /usr/bin/postmaster -D /usr/pgsql -l /var/log/pgsql.log -m fast restart 1>/dev/null\"" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_postgres_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _postgres_" >> /etc/rc.local
    echo "echo -n 'Starting postgresql:'" >> /etc/rc.local
    echo "sudo -u postgres /usr/bin/pg_ctl -w -p /usr/bin/postmaster -D /usr/pgsql -l /var/log/pgsql.log start > /dev/null" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

if ! grep -q -F '_postgres_' /etc/rc.shutdown; then
    echo "" >> /etc/rc.shutdown
    echo "# _postgres_" >> /etc/rc.shutdown
    echo "if [ -f /usr/pgsql/postmaster.pid ]; then" >> /etc/rc.shutdown
    echo "	cd /tmp && sudo -u postgres /usr/bin/pg_ctl stop -m fast -D /usr/pgsql" >> /etc/rc.shutdown
    echo "	rm -f /usr/pgsql/postmaster.pid" >> /etc/rc.shutdown
    echo "fi" >> /etc/rc.shutdown
    echo "" >> /etc/rc.shutdown
fi

if ! grep -q -F '_postgres_' /var/cron/tabs/root; then
    echo "" >> /var/cron/tabs/root
    echo "# _postgres_" >> /var/cron/tabs/root
    echo "0       2       *       *       *       /usr/bin/vacuumdb -a -f -q -z -U postgres" >> /var/cron/tabs/root
    echo "" >> /var/cron/tabs/root
    
    crontab -u root /var/cron/tabs/root
fi
