#!/bin/sh

SERVICES="smtps pop3s smtpd qmail pop3d"

        for a in $SERVICES
        do
                if [ -L /service/$a ]; then
                        echo "/service/$a symlink detected! Stopping..."
			cd /service/$a
			rm /service/$a
			svc -dx . log
                else
                        echo "/service/$a not found!"
                fi
        done


pkill tcpserver
pkill supervise

echo "\nLet's check readproc for errors..."
ps auxwww|grep readproc
