#!/bin/sh

TMP=`mktemp /tmp/_ip.XXXXXXXXXX`

cat /var/log/openvpn-server.log|grep "Peer Connection Initiated" \
	|cut -d" " -f7|grep -v "us="|cut -d":" -f1|sort -u > $TMP

echo "* LAN"

for a in `cat $TMP|egrep "192\.168\.|^10\.|172\.16\."`
        do
                IP=`echo $a`
                echo "$IP"
        done

echo "* WAN"

for a in `cat $TMP|egrep -v "192\.168\.|^10\.|172\.16\."`
	do
		IP=`echo $a`
		NAME=`host $a|cut -d" " -f5|sed -e s/"\.$"//`
		echo "$IP	$NAME"
	done

rm -f $TMP
