#!/bin/sh

if [ -r /etc/squid.conf ]; then
    TMP=`mktemp /etc/squid.conf.XXXXXX`
    cat /etc/squid.conf > $TMP
fi
