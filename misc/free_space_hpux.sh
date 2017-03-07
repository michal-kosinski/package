#!/bin/sh

#
# disk usage check for HP-UX using bdf command
#

SUB="Disk usage stats for `hostname` (WARNING!)"
RCPT="michal.kosinski@polkomtel.com.pl"
WARN_THRESHOLD="85"

for a in `bdf|egrep "act_mgr|ff_mgr"|awk '{ print $4 }'|sed s/" "//g|sed s/"%"//`

do
        if [ "$a" -gt "$WARN_THRESHOLD" ]; then
                echo "\n\n$SUB\n\n`bdf|head -1;bdf|egrep \"act_mgr|ff_mgr\"`\n" |mailx -s "$SUB" $RCPT
                exit
        fi
done
