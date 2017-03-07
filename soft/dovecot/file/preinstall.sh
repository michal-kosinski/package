#!/bin/sh

if [ -r /etc/dovecot.conf ]; then
    TMP=`mktemp /etc/dovecot.conf.XXXXXX`
    cat /etc/dovecot.conf > $TMP
fi
