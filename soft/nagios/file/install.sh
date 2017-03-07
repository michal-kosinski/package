#!/bin/sh

cd /etc/nagios
for f in *-sample ; do cp $f `basename $f -sample`; done
for f in nagios.cfg* ; do cat $f|sed s/"\/var\/nagios\/nagios.log"/"\/var\/log\/nagios.log"/ > $f.tmp ; mv $f.tmp $f ; done
#for f in *.cfg ; do cat $f|egrep -v "#|^$" > $f.tmp ; mv $f.tmp $f ; done
chown root.nagios /etc/nagios/* && chmod 644 /etc/nagios/*

mkdir /var/nagios && chown nagios.nagios /var/nagios
touch /var/log/nagios.log && chown nagios.nagios /var/log/nagios.log

if ! grep -q -F '_nagios_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _nagios_" >> /etc/newsyslog.conf
    echo "/var/log/nagios.log   nagios.nagios  600  10   1024  *     Z /var/run/nagios.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_nagios_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _nagios_" >> /etc/rc.local
    echo "echo -n 'Starting nagios:'" >> /etc/rc.local
    echo "/usr/bin/nagios -d /etc/nagios/nagios.cfg" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
