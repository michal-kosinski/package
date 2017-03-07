#!/bin/sh

if [ -x /etc/php5 ]; then
    TMP=`mktemp -d /etc/php5.XXXXXX`
    cp -rp /etc/php5/* $TMP
    chown -R root.wheel /etc/php5*
    find /etc -name "php5*" -type d -exec chmod 755 {} \;
    find /etc -name "php5*" -type f -exec chmod 644 {} \;
fi
