#!/bin/sh

export PKG_PATH="ftp://ftp.openbsd.org/pub/OpenBSD/`uname -r`/packages/i386"

CORE="xfce-mcs-manager xfce-mcs-plugins xfce-utils xfce4-panel xfce4-session thunar xfdesktop xfwm4"
BASIC="xfce4-icon-theme xfwm4-themes gtk-xfce-engine"
APPS="terminal orage notification-daemon-xfce ristretto mousepad xfce4-appfinder xfce4-mixer xfprint"
PLUGINS="xfce4-battery xfce4-clipman xfce4-dict xfce4-diskperf xfce4-fsguard xfce4-genmon xfce4-mailwatch xfce4-mpc xfce4-netload xfce4-notes xfce4-systemload xfce4-time-out xfce4-verve xfce4-weather xfce4-xkb"

if [ ! -z "$CORE" ]; then
	for x in $CORE
		do
			pkg_add $x
		done
fi

if [ ! -z "$BASIC" ]; then
        for x in $BASIC
                do
                        pkg_add $x
                done
fi

if [ ! -z "$APPS" ]; then
        for x in $APPS
                do
                        pkg_add $x
                done
fi

if [ ! -z "$PLUGINS" ]; then
        for x in $PLUGINS
                do
                        pkg_add $x
                done
fi

echo "%users ALL=NOPASSWD: /usr/local/libexec/xfsm-shutdown-helper" >> /etc/sudoers
echo "/usr/local/bin/startxfce4" >> $HOME/.xinitrc

pkg_info -M dbus xfce4-session
