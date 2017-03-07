#!/bin/sh

if [ -x /etc/syslog-ng ]; then
    TMP=`mktemp -d /etc/syslog-ng.XXXXXX`
    cp -rp /etc/syslog-ng/* $TMP
fi
