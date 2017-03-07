#!/bin/sh

if [ -x /etc/rsync ]; then
	TMP=`mktemp -d /etc/rsync.XXXXXX`
	cp -Rp /etc/rsync/* $TMP
	chmod 755 $TMP
fi
