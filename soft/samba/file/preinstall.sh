#!/bin/sh

if [ -x /etc/smb ]; then
    TMP=`mktemp -d /etc/smb.XXXXXX`
    cp -rp /etc/smb/* $TMP
fi
