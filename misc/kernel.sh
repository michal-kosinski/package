#!/bin/sh

if [ -x /usr/src/sys ]; then
        echo "updating /usr/src/sys..."
        cd /usr/src/sys && cvs -z6 up -dP
else
        echo "/usr/src/sys not found!\npress any key to download from cvs"
	read
        cd /usr/src && cvs -z6 -danoncvs@anoncvs.ca.openbsd.org:/cvs co -rOPENBSD_3_9 sys
fi

echo "press any key to compile and install new GENERIC kernel"
read

cp /bsd /bsd.old
cd /usr/src/sys/arch/i386/conf/
config GENERIC
cd /usr/src/sys/arch/i386/compile/GENERIC/
make clean && make depend && make && make install
