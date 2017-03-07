#!/bin/sh

mkdir -p /usr/arcavir/abases/tmp

if ! grep -q -F '_arcavir_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _arcavir_" >> /etc/rc.local
    echo "echo -n 'Starting arcavir:'" >> /etc/rc.local
    echo "/usr/arcavir/arcavird 5" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi

TMP=`mktemp /tmp/_replace.XXXXXXXXXX`
crontab -l > $TMP
echo "" >> $TMP
echo "0       5       *       *       *       /bin/sh /usr/arcavir/arcaupdate get verbose" >> $TMP
crontab $TMP
rm -f $TMP

/bin/sh /usr/arcavir/arcaupdate get verbose
