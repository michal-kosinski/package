#!/bin/sh

if [ -x /etc/http ]; then
    TMP=`mktemp -d /etc/http.XXXXXX`
    cp -rp /etc/http/* $TMP
fi
