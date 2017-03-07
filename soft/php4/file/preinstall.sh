#!/bin/sh

if [ -x /etc/php4 ]; then
    TMP=`mktemp -d /etc/php4.XXXXXX`
    cp -rp /etc/php4/* $TMP
    chown -R root.wheel /etc/php4*
    find /etc -name "php4*" -type d -exec chmod 755 {} \;
    find /etc -name "php4*" -type f -exec chmod 644 {} \;
fi
