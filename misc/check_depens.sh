#!/bin/sh

for a in `find ../soft -name Makefile -maxdepth 2|sort`
	do
    		if ! grep "DEPENDS=$" $a >/dev/null ; then
			 b=`cat $a|grep DEPENDS=|sed s/"DEPENDS="/""/g`
                         c=`echo $a|cut -d"/" -f3`
                         echo "package: $c  >>>  $b"
                fi
	done


