#!/bin/sh

if [ -x /etc/openvpn ]; then
    TMP=`mktemp -d /etc/openvpn.XXXXXX`
    cp -rp /etc/openvpn/* $TMP
fi
