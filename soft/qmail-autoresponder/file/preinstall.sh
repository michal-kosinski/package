#!/bin/sh

if [ -x /var/qmail/autoresponder ]; then
    TMP=`mktemp -d /var/qmail/autoresponder.XXXXXX`
    cp -rp /var/qmail/autoresponder/* $TMP
fi

