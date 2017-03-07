#!/bin/sh

T_NAT="/etc/table-nat"
T_NAT_DAY="/etc/table-nat-day"
T_NAT_NIGHT="/etc/table-nat-night"
T_NAT_NIGHT20="/etc/table-nat-night20"
T_NAT_PERMOFF="/etc/table-nat-permoff"
NAT_RESTART="/sbin/pfctl -F all -qf /etc/pf.conf"
NAT_LOG_0_MSG="`date` przelaczam w tryb DAY"
NAT_LOG_1_MSG="`date` przelaczam w tryb NIGHT20"
NAT_LOG_2_MSG="`date` przelaczam w tryb NIGHT"
NAT_LOG_FILE="/var/log/nat_restart.log"

if [ ! "$1" = "" ]; then

        if [ "$1" = "DAY" ]; then
                cat $T_NAT_DAY    |sed '/^$/d'  > $T_NAT
                cat $T_NAT_PERMOFF|sed '/^$/d' >> $T_NAT
                $NAT_RESTART
                echo "$NAT_LOG_0_MSG" >> $NAT_LOG_FILE
        fi

        if [ "$1" = "NIGHT20" ]; then
                cat $T_NAT_DAY    |sed '/^$/d'  > $T_NAT
                cat $T_NAT_NIGHT20|sed '/^$/d' >> $T_NAT
                cat $T_NAT_NIGHT  |sed '/^$/d' >> $T_NAT
                $NAT_RESTART
                echo "$NAT_LOG_1_MSG" >> $NAT_LOG_FILE
        fi

        if [ "$1" = "NIGHT" ]; then
                cat $T_NAT_DAY    |sed '/^$/d'  > $T_NAT
                cat $T_NAT_NIGHT  |sed '/^$/d' >> $T_NAT
                $NAT_RESTART
                echo "$NAT_LOG_2_MSG" >> $NAT_LOG_FILE
        fi
else
        echo "Brak parametru!"
fi
