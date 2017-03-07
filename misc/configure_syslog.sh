#!/bin/sh

cat /etc/syslog.conf \
	|sed s/"*.err"/"#*.err"/g \
        |sed s/"*.notice;auth.debug"/"#*.notice;auth.debug"/g \
        |sed s/"*.alert"/"#*.alert"/g \
	|sed s/"*.emerg"/"#*.emerg"/g > /etc/syslog.conf.new

mv /etc/syslog.conf.new /etc/syslog.conf

pkill -HUP syslogd
