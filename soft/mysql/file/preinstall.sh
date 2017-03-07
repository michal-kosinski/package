#!/bin/sh

if [ -x /usr/mysql/ ]; then
    TMP=`mktemp -d /usr/mysql.XXXXXX`
    cp -Rp /usr/mysql $TMP
fi

if [ -x /etc/mysql/ ]; then
    TMP=`mktemp -d /etc/mysql.XXXXXX`
    cp -p /etc/mysql/my* $TMP
fi

