#!/bin/sh

if [ -x /etc/snort ]; then
    TMP=`mktemp -d /etc/snort.XXXXXX`
    cp -rp /etc/snort/* $TMP
fi
