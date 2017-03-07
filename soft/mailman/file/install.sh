#!/bin/sh

mkdir -p /usr/mailman/archives/{private,public}
mkdir -p /usr/mailman/{lists,locks,logs,qfiles,spam}
chown mailman.mailman /usr/mailman && chmod 02775 /usr/mailman
/usr/mailman/bin/check_perms

if [ -x /var/qmail/alias ]; then {
	cd /var/qmail/alias
	ln -s .qmail-root .qmail-`hostname|sed s/"\."//g`-mailman
	ln -s .qmail-root .qmail-`hostname|sed s/"\."//g`-mailman-bounces
	}
fi

cd /usr/mailman/archives && chown httpd private && chmod o-x private

if [ -x /var/www/icons ]; then
	cp /usr/mailman/icons/*.{jpg,png} /var/www/icons
fi

echo "Creating default mailman list:"
/usr/mailman/bin/newlist mailman

crontab -u mailman < /usr/mailman/cron/crontab.in

if ! grep -q -F '_mailman_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _mailman_" >> /etc/rc.local
    echo "echo -n 'Starting mailman:'" >> /etc/rc.local
    echo "/usr/mailman/bin/mailmanctl start" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
