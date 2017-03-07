#!/bin/sh

mkdir -p /usr/mksvirus/tmp

if ! grep -q -F '_mks_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _mks_" >> /etc/rc.local
    echo "echo -n 'Starting mks_vir:'" >> /etc/rc.local
    echo "mkdir -p /var/run/mksd && /usr/mksvirus/mksd 5" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

TMP=`mktemp /tmp/_replace.XXXXXXXXXX`
crontab -l > $TMP
echo "" >> $TMP
echo "0       5       *       *       *       /bin/sh /usr/mksvirus/mksupdate.sh get verbose" >> $TMP
crontab $TMP
rm -f $TMP

echo "Download mks_vir databases now? (y/n)"
read MKS
if [ "$MKS" = "y" ]; then
	/bin/sh /usr/mksvirus/mksupdate.sh get verbose
fi
