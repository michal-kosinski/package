#!/bin/sh

if [ "$1" = "" ]; then
	echo "Usage: sh $0 foo.bar.com"
	exit 
fi

export D=/etc/openvpn/rsa
export OPENSSL_CONF=$D/openssl.cnf
export KEY_DIR=$D/keys
export KEY_SIZE=2048
export KEY_COUNTRY=PL
export KEY_PROVINCE=Mazowieckie
export KEY_CITY=Warszawa
export KEY_HOST=$1
export KEY_ORG=""
export KEY_EMAIL="root@"`hostname`

rm -rf $KEY_DIR/$1
mkdir -p $KEY_DIR/$1

openssl req -nodes -new -keyout $KEY_DIR/$1.key -out $KEY_DIR/$1.csr
openssl ca -out $KEY_DIR/$1.crt -in $KEY_DIR/$1.csr

cp $KEY_DIR/tls_auth.key $KEY_DIR/$1
cp $KEY_DIR/ca.crt $KEY_DIR/$1
cp $KEY_DIR/$1.crt $KEY_DIR/$1
cp $KEY_DIR/$1.key $KEY_DIR/$1


