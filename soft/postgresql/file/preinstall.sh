#!/bin/sh

if [ -x /usr/pgsql/ ]; then
    TMP=`mktemp -d /usr/pgsql.XXXXXX`
    cp -p /usr/pgsql/*.conf $TMP
fi
