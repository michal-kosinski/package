#!/bin/sh

KATALOG="/volume01/samba_bsdiff"
NAZWA=`hostname`
TAR="/usr/bin/gtar cf"
BZIP2="/usr/bin/bzip2 -1"
MY_DUMP="/usr/bin/mysqldump"
PG_DUMP="/usr/bin/pg_dump"
PG_DUMPALL="/usr/bin/pg_dumpall"
MKDIR="/bin/mkdir -p"
BSDIFF="/usr/bin/bsdiff"
BSPATCH="/usr/bin/bspatch"
RSYNC="/usr/bin/rsync"

date > $KATALOG/start

UNIQ=`date|md5`

SRC="$KATALOG/src"
DST="$KATALOG/dst"
DIFF="$KATALOG/diff"

#$RSYNC -v -a --update --delete --no-whole-file $SRC $DST


for filename_new in `find $SRC -type f|sed s/" "/"$UNIQ"/g`

do
	filename=`echo $filename_new	|sed s/"$UNIQ"/" "/g`
	sh get.sh "$filename" "2005-06-29 12:00:00" "new"
done

date > $KATALOG/stop
