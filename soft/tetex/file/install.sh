#!/bin/sh

if ! grep -q -F 'export PATH=$PATH:/usr/teTeX/bin' /etc/profile; then
 	echo "export PATH=\$PATH:/usr/teTeX/bin" >> /etc/profile ;\
fi

if ! grep -q -F 'export PATH=$PATH:/usr/teTeX/bin' /etc/skel/.profile; then
        echo "export PATH=\$PATH:/usr/teTeX/bin" >> /etc/skel/.profile ;\
fi

if ! grep -q -F 'export PATH=$PATH:/usr/teTeX/bin' /.profile; then
        echo "export PATH=\$PATH:/usr/teTeX/bin" >> /.profile ;\
fi

if ! grep -q -F 'export PATH=$PATH:/usr/teTeX/bin' /root/.profile; then
        echo "export PATH=\$PATH:/usr/teTeX/bin" >> /root/.profile ;\
fi

ln -s /usr/teTeX/texfonts /var/tmp/texfonts
