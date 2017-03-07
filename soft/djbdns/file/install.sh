#!/bin/sh

mkdir -p -m 700 /var/log/{dns,dnscache}
chown -R named.named /var/log/{dns,dnscache}

find /etc/dns* -name CVS -or -name .cvsignore -exec rm -rf {} \; 2>/dev/null
find /etc/dns* -name run -exec chmod +x {} \; 2>/dev/null

# update root nameservers for dnscache

ftp ftp://ftp.internic.net/domain/named.root
ftp http://www.thedjbway.org/djbdns/djbroot.sed

sed -f djbroot.sed named.root > dnsroots.global

if [ -s dnsroots.global ]; then
	cp dnsroots.global /etc/dnsroots.global
	cp dnsroots.global "/service/dnscache/root/servers/@"
	svc -t /service/dnscache
fi

rm -rf named.root djbroot.sed dnsroots.global

# quick update

# mv /etc/dnsroots.global /etc/dnsroot.global.old
# dnsip `dnsqr ns . | awk '/answer:/ { print $5; }' |sort` > /etc/dnsroots.global
# cp /etc/dnsroots.global /service/dnscache/root/servers/@
# svc -du /service/dnscache
