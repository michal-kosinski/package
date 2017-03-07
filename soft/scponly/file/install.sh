#!/bin/sh

if [ ! -x /home/chroot ]; then
	mkdir /home/chroot
fi

if ! grep -q -F 'scponly' /etc/shells; then
	echo /usr/bin/scponly >> /etc/shells
	echo /usr/sbin/scponlyc >> /etc/shells
fi

chmod +x /usr/sbin/addscpuser
