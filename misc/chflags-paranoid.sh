#!/bin/sh

chflags schg /bsd
chflags schg /etc/changelist
chflags schg /etc/daily
chflags schg /etc/inetd.conf
chflags schg /etc/netstart
chflags schg /etc/pf.conf
chflags schg /etc/rc
chflags schg /etc/rc.conf
chflags schg /etc/rc.local
chflags schg /etc/rc.securelevel
chflags schg /etc/rc.shutdown
chflags schg /etc/security
chflags schg /etc/mtree/special

chflags -R schg /bin
chflags -R schg /sbin
chflags -R schg /usr/bin
chflags -R schg /usr/libexec
chflags -R schg /usr/sbin
