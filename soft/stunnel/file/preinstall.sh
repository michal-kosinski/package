#!/bin/sh

if [ -x /etc/stunnel ]; then
    TMP=`mktemp -d /etc/stunnel.XXXXXX`
    cp -rp /etc/stunnel/* $TMP
fi

