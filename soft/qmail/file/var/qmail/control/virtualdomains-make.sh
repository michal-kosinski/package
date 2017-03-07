#!/bin/sh

for a in `cat /etc/dns/root/data_new|grep %`
do
	b=`echo $a|sed s/"%"//`
	c=`echo $b|sed s/"\."//g|sed s/"-"//g`
	echo "$b:alias-$c"
done
