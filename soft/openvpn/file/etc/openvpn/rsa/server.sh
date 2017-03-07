#!/bin/sh

export D=/etc/openvpn/rsa
export OPENSSL_CONF=$D/openssl.cnf
export KEY_DIR=$D/keys
export KEY_SIZE=2048
export KEY_COUNTRY=PL
export KEY_PROVINCE=Mazowieckie
export KEY_CITY=Warszawa
export KEY_HOST=`hostname`
export KEY_ORG=""
export KEY_EMAIL="root@`hostname`"

mkdir -p $KEY_DIR
cp /dev/null $KEY_DIR/index.txt
echo 01 > $KEY_DIR/serial

KEY_HOST_OLD=$KEY_HOST
export KEY_HOST=`hostname`
openssl req -nodes -new -x509 -keyout $KEY_DIR/ca.key -out $KEY_DIR/ca.crt -days 3650
export KEY_HOST=$KEY_HOST_OLD
openvpn --genkey --secret $KEY_DIR/tls_auth.key
openssl req -nodes -new -keyout $KEY_DIR/server.key -out $KEY_DIR/server.csr
openssl ca -out $KEY_DIR/server.crt -in $KEY_DIR/server.csr
openssl dhparam -out $KEY_DIR/dh2048.pem $KEY_SIZE



