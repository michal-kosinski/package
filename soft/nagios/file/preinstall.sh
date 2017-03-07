#!/bin/sh

if [ -x /etc/nagios ]; then
    TMP=`mktemp -d /etc/nagios.XXXXXX`
    cp -rp /etc/nagios/* $TMP
fi

