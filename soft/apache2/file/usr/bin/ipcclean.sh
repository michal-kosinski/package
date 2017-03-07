#!/bin/sh

date >> /var/log/ipcclean.log

/usr/sbin/apachectl stop 2>&1|grep -v "does not exist" >> /var/log/ipcclean.log


while [ 1 ]

do

HTTPD_COUNT=`ps -U httpd |grep http|grep -v proftpd|wc -l|sed s/" "/""/g`
#echo $HTTPD_COUNT

if [ "$HTTPD_COUNT" = 0 ]; then {
   /usr/bin/sudo -u httpd /usr/bin/ipcclean
   /usr/sbin/apachectl start 2>&1|grep -v "does not exist" >> /var/log/ipcclean.log
   break
}

fi

done

sleep 10

/usr/sbin/apachectl start 2>&1|grep -v "does not exist" >> /var/log/ipcclean.log

