#!/bin/sh

if [ -r /etc/snmpd.conf ]; then
    TMP=`mktemp /etc/snmpd.conf.XXXXXX`
    cat /etc/snmpd.conf > $TMP
fi
