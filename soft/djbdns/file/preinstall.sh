#!/bin/sh

if [ -x /etc/dns/root ]; then
    TMP=`mktemp -d /etc/dns/root.XXXXXX`
    cp -rp /etc/dns/root/* $TMP
    chmod 755 /etc/dns/root
fi

if [ -x /etc/dnscache/root ]; then
    TMP=`mktemp -d /etc/dnscache/root.XXXXXX`
    cp -rp /etc/dnscache/root/* $TMP
    chmod 755 /etc/dnscache/root
fi
