#!/bin/sh

cat /etc/sysctl.conf \
	|sed s/"#ddb.panic=0"/"ddb.panic=0"/g > /etc/sysctl.conf,new

mv /etc/sysctl.conf,new /etc/sysctl.conf
