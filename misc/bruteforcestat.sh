#!/bin/sh

echo "COUNT	LAST			IP		NAME"
for IP in `pfctl -t ssh-bruteforce -T show`
	do
		CNT=`grep ${IP} /var/log/authlog|grep -c "Failed password"`
		LAST=`grep ${IP} /var/log/authlog|grep "Failed password"|tail -1|awk '{print $1 " " $2 " " $3}'`
		NAME=`host ${IP}|awk '{print $5}'`
		echo "${CNT}	${LAST}		${IP}	${NAME}"
	done
