#!/bin/sh

cd /usr && cvs -z6 -danoncvs@anoncvs.ca.openbsd.org:/cvs co -rOPENBSD_3_8 ports
cd /usr/src && cvs -z6 -danoncvs@anoncvs.ca.openbsd.org:/cvs co -rOPENBSD_3_8 sys
