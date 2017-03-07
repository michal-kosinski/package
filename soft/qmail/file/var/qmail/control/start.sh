#!/bin/sh

SERVICES="pop3d qmail smtpd pop3s smtps"

        for a in $SERVICES
        do
                if [ -L /service/$a ]; then
                        echo "/service/$a symlink detected! Nothing done..."
                else
                        echo "/service/$a not found! Starting..."
			ln -s /var/qmail/service/$a /service/$a
                fi
        done

echo "\nLet's check readproc for errors..."
ps auxwww|grep readproc
