#!/bin/sh

if [ -f /tmp/httpd_restart ]; then {

        touch /tmp/httpd_restart_in_progress

	if [ -r /var/run/httpd.pid ]; then
		PID=`cat /var/run/httpd.pid`
		/usr/sbin/apachectl stop && sleep 1
		kill -9 $PID
	fi

	if [ -r /usr/local/apache/logs/httpd.pid ]; then
		PID=`cat /usr/local/apache/logs/httpd.pid`
		/usr/sbin/zend stop && sleep 1
		kill -9 $PID
	fi

        if [ -r /usr/local/apache5/logs/httpd.pid ]; then
                PID=`cat /usr/local/apache5/logs/httpd.pid`
		/usr/sbin/zend5 stop && sleep 1
                kill -9 $PID
        fi

	pkill httpd && sleep 2
	pkill httpd && sleep 2

	while [ 1 ]
	do
		HTTPD_COUNT=`ps -U httpd |grep http |wc -l|sed s/" "/""/g`
		if [ "$HTTPD_COUNT" = 0 ]; then {
			/usr/bin/sudo -u httpd /usr/bin/ipcclean
			/usr/sbin/apachectl start
                        /usr/sbin/zend start
			/usr/sbin/zend5 start
			date >> /var/log/httpd_restart.log
   			rm -f /tmp/httpd_restart /tmp/httpd_restart_in_progress
   			break
		}
		fi
	done
	}
fi

if [ -r /tmp/httpd_restart ]; then
	rm /tmp/httpd_restart
fi

if [ -r /tmp/httpd_restart_in_progress ]; then
        rm /tmp/httpd_restart_in_progress
fi
