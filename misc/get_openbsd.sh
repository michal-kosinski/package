#!/bin/sh
#
# get_openbsd.sh: OpenBSD iso image creation script.
#
# written by:  Michal Kosinski, <mkosinski@info-trade.pl>
#

# work dir
WDIR="/root"

# mirror url
#MIRROR="http://ftp.sunet.se/pub/OpenBSD"
MIRROR="ftp://ftp.openbsd.org/pub/OpenBSD"

# last available OpenBSD release version 
LAST="4.3"

# mkisofs path 
MKISOFS="/usr/bin/mkisofs"

# wget path
WGET="/usr/bin/wget"

# MD5 path
MD5="/bin/md5"

### DO NOT EDIT ANYTHING BELOW THIS LINE !!!

echo '
#include <stdio.h>
#include <termios.h>


int main(void)
{
        struct termios t, saved;
        int c;


        tcgetattr(0, &t);
        saved = t;
        t.c_lflag &= ~(ICANON|ECHO);
        t.c_cc[VTIME] = 0;
        t.c_cc[VMIN] = 1;
        tcsetattr(0, TCSANOW, &t);
        fflush(stdout);
        c = getchar();
        printf("%d", c);
        tcsetattr(0, TCSANOW, &saved);
        return 0;


}' > $WDIR/grabchars.c

gcc grabchars.c -o $WDIR/grabchars
alias grabchars="$WDIR/grabchars"

SNAP=`echo "$LAST 0.1 + p q"|dc`
MIRRORDIR=`echo $MIRROR|cut -d"/" -f3`

if [ ! -x $MKISOFS ]; then {
	echo "$MKISOFS not found!"
        exit 1
	}
fi

if [ ! -x $WGET ]; then {
        echo "$WGET not found!"
        exit 1
        }
fi

echo "
Choose OpenBSD version:

 1 - release  ($LAST)
 2 - snapshot ($SNAP)
"

stty_orig=`stty -g` ; stty -echo ; VERSION=`grabchars` ; stty $stty_orig

if [ "$VERSION" = "49" ] || [ "$VERSION" = "50" ]; then {
	if [ $VERSION = 49 ]; then VERSION="release" ; fi
        if [ $VERSION = 50 ]; then VERSION="snapshot" ; fi
	}
else
	exit 1
fi

if [ $VERSION = "snapshot" ]; then {
        DIR=$SNAP
        }
fi

if [ $VERSION = "release" ]; then {
        DIR=$LAST
        }
fi

if [ $VERSION = "snapshot" ]; then {
        DIR_NODOT=`echo $SNAP|sed s/"\."//g`
        }
fi

if [ $VERSION = "release" ]; then {
        DIR_NODOT=`echo $LAST|sed s/"\."//g`
        }
fi

if ! [ -x $WDIR/$VERSION/$DIR/i386 ]; then {
	echo "Creating $WDIR/$DIR/$DIR/i386 directory..."
	rm -rf $WDIR/$DIR/$DIR/i386
	mkdir -p $WDIR/$DIR/$DIR/i386
	}	
fi

# ports 
echo "Should ports.tar.gz be included? (y/n)"
stty_orig=`stty -g` ; stty -echo ; PORTS=`grabchars` ; stty $stty_orig

# src sources
if [ "$VERSION" = "release" ]; then
	echo "Should src.tar.gz be included? (y/n)"
	stty_orig=`stty -g` ; stty -echo ; SRC=`grabchars` ; stty $stty_orig
fi

# sys sources
if [ "$VERSION" = "release" ]; then
	echo "Should sys.tar.gz be included? (y/n)"
	stty_orig=`stty -g` ; stty -echo ; SYS=`grabchars` ; stty $stty_orig
fi

echo "Ready to begin download? (y/n)"
stty_orig=`stty -g` ; stty -echo ; CONFIRM=`grabchars` ; stty $stty_orig

rm -rf $WDIR/$MIRRORDIR

if [ "$CONFIRM" = "121" ]; then {

	if [ "$VERSION" = "snapshot" ]; then
		$WGET -r -np $MIRROR/snapshots/i386/
	fi

	if [ "$VERSION" = "release" ]; then
		$WGET -r -np $MIRROR/$DIR/i386/
	fi

if [ "$PORTS" = "121" ]; then
	if [ "$VERSION" = "snapshot" ]; then
		$WGET $MIRROR/snapshots/ports.tar.gz -O $WDIR/$DIR/$DIR/i386/ports.tar.gz 
	fi

	if [ "$VERSION" = "release" ]; then
                $WGET $MIRROR/$DIR/ports.tar.gz -O $WDIR/$DIR/$DIR/i386/ports.tar.gz
        fi

fi

if [ "$SRC" = "121" ]; then
	$WGET $MIRROR/$DIR/src.tar.gz -O $WDIR/$DIR/$DIR/i386/src.tar.gz
fi

if [ "$SYS" = "121" ]; then
        $WGET $MIRROR/$DIR/sys.tar.gz -O $WDIR/$DIR/$DIR/i386/sys.tar.gz
fi

echo "Preparing directory structure for ISO Image..."

if [ "$VERSION" = "snapshot" ]; then mv $WDIR/$MIRRORDIR/pub/OpenBSD/snapshots/i386/* $WDIR/$DIR/$DIR/i386/ ; fi
if [ "$VERSION" = "release" ];  then mv $WDIR/$MIRRORDIR/pub/OpenBSD/$DIR/i386/*      $WDIR/$DIR/$DIR/i386/ ; fi

echo "Checking MD5 sums for downloaded files..."
MYPWD=`pwd` && cd $WDIR/$DIR/$DIR/i386 && $MD5 -c MD5 && cd $MYPWD

if [ "$?" = 0 ]; then
	rm -f $WDIR/$DIR/$DIR/i386/index.html*
	rm -rf $WDIR/$MIRRORDIR
else
	echo "MD5 sums not match!"
	exit 1
fi

echo "Done."

	mkisofs -r -l -T -J \
	-V "OpenBSD-$DIR" \
	-A "OpenBSD v$DIR-$VERSION" \
	-b $DIR/i386/cdrom$DIR_NODOT.fs \
	-c boot.catalog \
	-o OpenBSD-$DIR.iso \
	-x OpenBSD-$DIR.iso $WDIR/$DIR


ls -l $WDIR/OpenBSD-$DIR.iso*

}

fi

echo "Remove source files? (y/n)"
stty_orig=`stty -g` ; stty -echo ; REMOVE=`grabchars` ; stty $stty_orig

if [ "$REMOVE" = "121" ]; then
	rm -rf $WDIR/$DIR
fi

rm -f $WDIR/grabchars $WDIR/grabchars.c
unalias grabchars

echo "All done."

exit 0
