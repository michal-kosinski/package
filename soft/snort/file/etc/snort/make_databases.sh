#!/bin/sh

echo "CREATE DATABASE snort;" | mysql -u root -p
mysql -D snort -u root -p < /etc/snort/create_mysql

echo "CREATE DATABASE snort_archive;" | mysql -u root -p
mysql -D snort_archive -u root -p < /etc/snort/create_mysql

echo "CREATE DATABASE snort with encoding = 'UNICODE';" | psql template1 postgres
psql snort < /etc/snort/create_postgresql

echo "CREATE DATABASE snort_archive with encoding = 'UNICODE';" | psql template1 postgres
psql snort_archive < /etc/snort/create_postgresql

