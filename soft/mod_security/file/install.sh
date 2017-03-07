#!/bin/sh

wget -q http://www.modsecurity.org/download/modsecurity-rules-current.tar.gz -O modsecurity-rules-current.tar.gz
tar zxf modsecurity-rules-current.tar.gz -C /etc/http
rm -f modsecurity-rules-current.tar.gz
