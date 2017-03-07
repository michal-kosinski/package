#!/bin/sh

if ! grep -q -F '_openvpn_' /etc/newsyslog.conf; then
    echo "" >> /etc/newsyslog.conf
    echo "# _openvpn_" >> /etc/newsyslog.conf
    echo "/var/log/openvpn-server.log    root.wheel   600  10   1024  *     Z /var/run/openvpn.pid SIGUSR1" >> /etc/newsyslog.conf
    echo "" >> /etc/newsyslog.conf
    pkill -HUP syslogd
fi

if ! grep -q -F '_openvpn_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _openvpn_" >> /etc/rc.local
    echo "echo -n 'Starting openvpn:'" >> /etc/rc.local
    echo "/usr/sbin/openvpn --config /etc/openvpn/openvpn-server.conf" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
