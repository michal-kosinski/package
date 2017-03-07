#!/bin/sh

if [ ! -x /etc/qmail ]; then
	mkdir /etc/qmail && cd /etc/qmail
	for a in /var/qmail/control/* ; do ln -sf $a ; done
fi

mkdir -p /etc/skel/Maildir/{cur,new,tmp}
mkdir -p /var/qmail/queue/{bounce,info,intd,local,mess,pid,remote,todo}

chmod 700 /var/qmail/queue/*
chmod 750 /var/qmail/queue/{lock,mess,todo}

chown qmails /var/qmail/queue/{bounce,info,remote}
chown qmailq /var/qmail/queue/{intd,lock,mess,pid,todo}

chgrp qmail /var/qmail/queue/*

echo "\nReady to run qmail from /service (y/n)?"
read RUNCHECK

SERVICES="pop3d pop3s qmail smtpd smtps"

if [ "$RUNCHECK" = "y" ]; then
	for a in $SERVICES
	do
		if [ ! -L /service/$a ]; then
			echo "/service/$a symlink not detected! Making one..."
			ln -s /var/qmail/service/$a /service/$a
		else
			echo "/service/$a already there!"
		fi
	done
	echo "Let's check readproc for errors..."
	ps auxwww|grep readproc
fi

TMP=`mktemp /tmp/_replace.XXXXXXXXXX`
crontab -l > $TMP
echo "" >> $TMP
echo "# _smtpd-stat_" >> $TMP
echo "0       7       *       *       *       /bin/sh /var/qmail/service/smtpd-arcavir.sh|mail -s "SMTP virus statistics for `hostname`" root@localhost report_linux@arcabit.com && /bin/sh /var/qmail/service/smtpd-stat.sh|mail -s "SMTP statistics for `hostname`" root@localhost && pkill -ALRM multilog" >> $TMP
crontab $TMP
rm -f $TMP

echo '
echo "autowhitelist size: `cat /var/qmail/control/autowhitelist|wc -l|sed s/" "//g`"
/bin/sh /var/qmail/service/smtpd-arcavir.sh' >> /root/.profile

