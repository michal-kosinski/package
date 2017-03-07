#!/bin/sh

cat /etc/sysctl.conf \
        |sed s/"#kern.emul.linux=1"/"kern.emul.linux=1"/ > /etc/sysctl.conf.tmp

mv /etc/sysctl.conf.tmp /etc/sysctl.conf

pkg_add ftp://ftp.openbsd.org/pub/OpenBSD/`uname -r`/packages/i386/redhat_base-8.0p9.tgz

mkdir /proc
echo "/proc /proc procfs rw,linux 0 0" >> /etc/fstab
mount /proc && sysctl -w kern.emul.linux=1
