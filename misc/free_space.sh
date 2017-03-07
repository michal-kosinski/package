#!/bin/sh

SUB="Disk usage stats for `hostname` (WARNING!!!)"
RCPT="m.kosinski@voidsystems.pl"
WARN_THRESHOLD="75"

for a in `df -hi|grep "/dev"|awk '{ print $5 }'|sed s/%//g|sed s/" "//g`
do
        if [ "$a" -gt "$WARN_THRESHOLD" ]; then
                echo "\n$SUB\n\n`df -hi`\n"|mail -s "$SUB" $RCPT
                exit
        fi
done
