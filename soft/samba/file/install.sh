#!/bin/sh

mkdir -p /home/samba/temporary
mkdir -p /var/log/samba/locks
mkdir -p /etc/smb/private
ln -s /etc/smb/private /usr/samba/private

chown -R samba.samba /home/samba
chown -R samba.samba /etc/smb
chown -R samba.samba /var/log/samba
chmod -R 700 /home/samba
chmod -R 700 /etc/smb
chmod -R 755 /var/log/samba

if ! grep -q -F '_samba_' /etc/rc.local; then
    echo "" >> /etc/rc.local
    echo "# _samba_" >> /etc/rc.local
    echo "echo -n 'Starting samba:'" >> /etc/rc.local
    echo "smbd -D" >> /etc/rc.local
    echo "nmbd -D" >> /etc/rc.local
    echo "echo ." >> /etc/rc.local
    echo "" >> /etc/rc.local
fi
