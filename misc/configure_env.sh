#!/bin/sh

PACKAGE_DIR="/usr/package"

if [ -r /.profile ]; then
	patch -p0 /.profile < $PACKAGE_DIR/misc/profile.diff
	rm -f /.profile.orig
fi

if [ -r /root/.profile ]; then
	patch -p0 /root/.profile < $PACKAGE_DIR/misc/profile.diff
	rm -f /root/.profile.orig
fi

TEXT=`cat /etc/myname|cut -d"." -f1`
TMP=`mktemp /tmp/_banner.XXXXXXXXXX`
lynx -dump "http://www.network-science.de/ascii/ascii.php?TEXT=$TEXT&FONT=graffiti&RICH=no&FORM=left&STRE=no&x=30&y=10" sed s/'\\\\'/'\\\\\\'/g > $TMP

if [ ! -r /etc/profile ]; then

echo ' 
export DISPLAY=:0.0
export SYSSCREENRC="/etc/screenrc"

export PS1=$"USER"@`hostname -s`:$"PWD"$PS1
export PGHOST="127.0.0.1" PGDATABASE="template1" PGUSER="postgres"

# customize CVS
CVSEDITOR=vi
CVSROOT=commiter@83.19.130.6:/cvs
CVS_RSH=ssh
export CVSEDITOR CVSROOT CVS_RSH

# customize less
LESS='-n-M'
PAGER=less
export LESS PAGER

# aliases for root
if [ $USER = "root" ]; then
	alias cp="cp -i"
	alias mv="mv -i"
	alias rm="rm -i"
	alias halt="echo To halt the system use unalias first!"
fi

# aliases
alias l=less
alias ll="ls -la"
alias h=history
alias s=screen
alias top="top -s 1"


alias 777="find . -type d -exec chmod 777 {} \;"
alias 666="find . -type f -exec chmod 666 {} \;"
alias 755="find . -type d -exec chmod 755 {} \;"
alias 644="find . -type f -exec chmod 644 {} \;"
alias 700="find . -type d -exec chmod 700 {} \;"
alias 600="find . -type f -exec chmod 600 {} \;"
' >> /etc/profile

echo "echo '" >> /etc/profile
awk 'NR==7, NR==12' $TMP >> /etc/profile
echo "'" >> /etc/profile

echo '

if [ -x /usr/bin/php ] && [ -r /usr/package/misc/release.php ]; then
        php -n /usr/package/misc/release.php
fi

mesg n ; uname -a ; w ; echo ; df -hi ; echo ; quota -v
' >> /etc/profile

fi

rm -f $TMP

echo "Backup /etc/service file and replace with one from portsdb.org? (y/n)"
read SERVICES

if [ "$SERVICES" = "y" ]; then {
        TMP=`mktemp /etc/services.XXXXXX`
        cp -p /etc/services $TMP
        echo "Backup stored in $TMP"
        lynx -dump http://www.portsdb.org/PortsDB/services > /etc/services
        }
fi

echo "Backup /etc/hosts file and add ad-banners hosts from pgl.yoyo.org/adservers? (y/n)"
read HOSTS

if [ "$HOSTS" = "y" ]; then {
        TMP=`mktemp /etc/hosts.XXXXXX`
        cp -p /etc/hosts $TMP
        echo "Backup stored in $TMP"
        lynx -dump "http://pgl.yoyo.org/adservers/serverlist.php?showintro=0&hostformat=hosts"|grep 127.0.0.1 >> /etc/hosts
        }
fi

echo "Remove the 5 second pause at boot-time permanently? (y/n)"
read BOOT
if [ "$BOOT" = "y" ]; then {
	echo "boot" > /etc/boot.conf
	}
fi

echo "Set schg flags for /bsd and /bin/*? (y/n)"
read SCHG
if [ "$SCHG" = "y" ]; then {
	chflags schg /bsd
	chflags -R schg /bin
	}
fi
