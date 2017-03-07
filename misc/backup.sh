#!/bin/sh

KATALOG="/root/_backup"
NAZWA=`hostname`
TAR="/bin/tar cf"
ZIP="/usr/bin/gzip -1"
MY_DUMP="/usr/bin/mysqldump"
PG_DUMP="/usr/bin/pg_dump"
PG_DUMPALL="/usr/bin/pg_dumpall"
MKDIR="/bin/mkdir -p"

date > $KATALOG/start

# remove old backups

#DELETE=`find $KATALOG -type d -mindepth 3 -print |sort -u|head -1`
#rm -rf $DELETE
#echo "`date` - usunalem $DELETE" >> $KATALOG/backup.log

# files backup

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$TAR $KATALOG/$NAZWA-etc-$DATA.tar /etc /var/cron/tabs /root/.ssh

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$TAR $KATALOG/$NAZWA-www-$DATA.tar --exclude=log /home/www/*

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$TAR $KATALOG/$NAZWA-qmail-$DATA.tar /var/qmail/control /var/qmail/alias /var/qmail/service /var/qmail/autoresponder /var/qmail/rc

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$TAR $KATALOG/$NAZWA-mysql_files-$DATA.tar /usr/mysql/*

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$TAR $KATALOG/$NAZWA-service-$DATA.tar /service/

# databases backup

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$PG_DUMPALL -c -D -s -U postgres > $KATALOG/$NAZWA-pgsql_schema-$DATA.sql

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$PG_DUMPALL -c -D -U postgres > $KATALOG/$NAZWA-pgsql_insert-$DATA.sql

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$PG_DUMPALL -c -U postgres > $KATALOG/$NAZWA-pgsql_copy-$DATA.sql

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$PG_DUMP -C -U postgres tajna_baza > $KATALOG/$NAZWA-pgsql_tajna_baza-$DATA.sql

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$MY_DUMP --all-databases --all -uroot -ptajne_haslo > $KATALOG/$NAZWA-mysql-$DATA.sql

#DATA=`date "+%Y-%m-%d_%H-%M-%S"`
#$MY_DUMP -utajny_user -ptajne_haslo tajna_baza > $KATALOG/$NAZWA-mysql_tajna_baza-$DATA.sql

$ZIP $KATALOG/{*tar,*sql}

ROK=`date "+%Y"`
MIESIAC=`date "+%m"`
DZIEN=`date "+%d"`

if [ ! -x $KATALOG/Archiwum-$ROK/$MIESIAC/$DZIEN ]; then
	$MKDIR $KATALOG/Archiwum-$ROK/$MIESIAC/$DZIEN
	chmod 700 $KATALOG/Archiwum-$ROK/$MIESIAC/$DZIEN
fi

mv $KATALOG/*gz $KATALOG/Archiwum-$ROK/$MIESIAC/$DZIEN
chmod 600 $KATALOG/Archiwum-$ROK/$MIESIAC/$DZIEN/*gz
chown -R 0.0 $KATALOG

date > $KATALOG/stop
