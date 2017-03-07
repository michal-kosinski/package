#!/bin/sh


cat /etc/ssh/sshd_config \
        |sed s/"#Protocol 2,1"/"Protocol 2"/g \
	|sed s/"#AddressFamily any"/"AddressFamily inet"/g \
        |sed s/"#PermitRootLogin yes"/"PermitRootLogin without-password"/g \
	|sed s/"#ServerKeyBits 768"/"ServerKeyBits 1024"/g \
        |sed s/"#KeyRegenerationInterval 1h"/"KeyRegenerationInterval 3600"/g \
	|sed s/"#LoginGraceTime 2m"/"LoginGraceTime 600"/g \
        |sed s/"#ClientAliveInterval 0"/"ClientAliveInterval 60"/g \
        |sed s/"#ClientAliveCountMax 3"/"ClientAliveCountMax 30"/g \
        |sed s/"#UseDNS yes"/"UseDNS no"/g > /etc/ssh/sshd_config.new

mv /etc/ssh/sshd_config.new /etc/ssh/sshd_config

echo "
HashKnownHosts yes
Compression yes
CompressionLevel 6" >> /etc/ssh/ssh_config

echo
echo "UWAGA: DODAJ SIE DO GRUPY WHEEL !!!"
echo
