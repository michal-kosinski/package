#!/bin/sh

echo "
if [ \"\$SHELL\" = \"/bin/bash\" ] || [ \"\$SHELL\" = \"/usr/bin/bash\" ] ; then
        PS1='\u@\h:\w\$ '
fi
" >> /etc/profile

echo "/bin/bash" >> /etc/shells
cd /bin && ln -sf /usr/bin/bash
