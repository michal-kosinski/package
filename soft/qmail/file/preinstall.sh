#!/bin/sh

if [ -x /var/qmail ]; then
    TMP=`mktemp -d /var/qmail.XXXXXX`
    cp -rp /var/qmail/* $TMP
fi

if [ -f /etc/mailer.conf ]; then
    TMP=`mktemp /etc/mailer.XXXXXX`
    cp -p /etc/mailer.conf $TMP
fi
