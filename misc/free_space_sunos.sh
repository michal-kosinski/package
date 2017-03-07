#!/bin/sh

#
# disk usage check for SunOS using df command
#

SUB="Disk usage stats for `hostname` (WARNING!)"
RCPT="michal.kosinski@polkomtel.com.pl"
WARN_THRESHOLD="95"

for a in `df -k|egrep "plusnet"|awk '{ print $5 }'|sed s/" "//g|sed s/"%"//`

do
        if [ "$a" -gt "$WARN_THRESHOLD" ]; then
                echo "\n\n$SUB\n\n`df -k|head -1;df -k|grep plusnet|grep $a%`\n" |mailx -s "$SUB" $RCPT
        fi
done
