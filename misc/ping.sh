#!/bin/sh

TMP=`mktemp /tmp/_ping.XXXXXXXXXX`
COUNT="1001"
RCPT="mkosinski@info-trade.pl pchrzanowski@info-trade.pl msalamon@info-trade.pl"
WARN_THRESHOLD="50"

if [ ! "$1" = "" ]; then
        echo "" > $TMP
        START=`date`
        /sbin/ping -w 2 -q -c $COUNT $1 >> $TMP
        STOP=`date`
        MIN=`cat $TMP|grep round-trip|cut -d"/" -f4|sed s/"std-dev = "//g`
        AVG=`cat $TMP|grep round-trip|cut -d"/" -f5`
        AVG_DOTLESS=`cat $TMP|grep round-trip|cut -d"/" -f5|cut -d. -f1|sed s/" "//g`
        MAX=`cat $TMP|grep round-trip|cut -d"/" -f6`
        echo "\nmin: $MIN\navg: $AVG\nmax: $MAX" >> $TMP
        echo "\nstart: $START\nstop:  $STOP" >> $TMP
        echo "\nwarning threshold: $WARN_THRESHOLD ms\n" >> $TMP

        if [ ! `grep round-trip "$TMP"` ]; then
                cat $TMP|mail -s "ICMP stats for $1 (DEAD!!!)" $RCPT
        fi

        if [ "$AVG_DOTLESS" -gt "$WARN_THRESHOLD" ]; then
                cat $TMP|mail -s "ICMP stats for $1 (WARNING!!!)" $RCPT
        else
                cat $TMP|mail -s "ICMP stats for $1" $RCPT
        fi
        rm -f $TMP
else
        echo "Argument missing! Usage: $0 <ip_address>"
fi

