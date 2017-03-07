#!/bin/sh

cat /etc/rc.conf \
        |sed s/"pf=NO"/"pf=YES"/g \
        |sed s/"inetd=YES"/"inetd=NO"/g \
        |sed s/"check_quotas=YES"/"check_quotas=NO"/g > /etc/rc.conf.new

mv /etc/rc.conf.new /etc/rc.conf

echo "
root:   m.kosinski@voidsystems.pl" >> /etc/mail/aliases

/usr/bin/newaliases
