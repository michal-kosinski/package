#!/bin/sh


TMP=`mktemp /var/qmail/control/files.XXXXXXXXXX`

cat /var/qmail/control/virtualdomains|sort -u > $TMP
mv $TMP /var/qmail/control/virtualdomains
chmod 644 /var/qmail/control/virtualdomains
pkill qmail-send
