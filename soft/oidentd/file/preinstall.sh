#!/bin/sh

if [ -r /etc/oidentd_masq.conf ]; then
    TMP=`mktemp /etc/oidentd_masq.conf.XXXXXX`
    cat /etc/oidentd_masq.conf > $TMP
fi
