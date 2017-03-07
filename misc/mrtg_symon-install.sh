#!/bin/sh

export PKG_PATH="ftp://ftp.openbsd.org/pub/OpenBSD/`uname -r`/packages/i386"

CORE="mrtg symon syweb"

if [ ! -z "$CORE" ]; then
	for x in $CORE
		do
			pkg_add -v $x
		done
fi

# snmpd start

if [ -x /usr/sbin/snmpd ]; then
	/usr/sbin/snmpd
fi

# mrtg

mkdir -p /var/www/htdocs/mrtg

if [ -x /usr/local/bin/cfgmaker ]; then
	/usr/local/bin/cfgmaker localhost > /etc/mrtg.cfg
	/usr/local/bin/mrtg /etc/mrtg.cfg # add to crontab or use --daemon switch
fi

if [ -s /etc/mrtg.cfg ]; then
	echo    "WorkDir: /var/www/htdocs/mrtg" >> /etc/mrtg.cfg
	echo -n "Options[_]: growright, bits"   >> /etc/mrtg.cfg
fi

if [ -x /usr/local/bin/indexmaker ]; then
	/usr/local/bin/indexmaker --title="MRTG @ `uname -a`" /etc/mrtg.cfg > /var/www/htdocs/mrtg/index.html
fi

# symon

mkdir -p /var/www/symon/rrds/localhost
ln -s /var/www/conf/modules.sample/php5.conf /var/www/conf/modules
if [ -x /usr/local/share/symon/c_smrrds.sh ]; then
	/usr/local/share/symon/c_smrrds.sh all
fi

if [ -x /var/www/symon/install_rrdtool.sh ]; then
	/var/www/symon/install_rrdtool.sh
fi

echo "
if [ -x /usr/local/libexec/symux ] && [ -x /usr/local/libexec/symon ] ; then
    echo -n ' symux';   /usr/local/libexec/symux
    echo -n ' symon';   /usr/local/libexec/symon
fi" >> /etc/rc.local

pkg_info -M symon syweb
