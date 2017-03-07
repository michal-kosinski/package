#!/bin/sh

if [ ! -x /etc/stunnel ]; then
	mkdir /etc/stunnel
fi

cd /etc/stunnel

if [ ! -r ssl.ca-0.1.tar.gz ]; then
	wget http://www.openssl.org/contrib/ssl.ca-0.1.tar.gz
fi

if [ ! -x ssl.ca-0.1 ]; then
	tar zxf ssl.ca-0.1.tar.gz
	patch -p0 < ssl.ca.patch
fi

cd ssl.ca-0.1

HOSTNAME=`hostname`
echo "Do you want to generate CA and server cert for $HOSTNAME? (y/n)"
read CONFIRM

	if [ "$CONFIRM" = "y" ]; then

rm -rf ca.db.certs
rm -f ca.*
rm -f $HOSTNAME*

sh new-root-ca.sh
sh new-server-cert.sh $HOSTNAME
sh sign-server-cert.sh $HOSTNAME
cat $HOSTNAME.crt $HOSTNAME.key > $HOSTNAME.pem
openssl crl2pkcs7 -nocrl -certfile $HOSTNAME.crt -outform DER -out $HOSTNAME.pkcs7

if [ -x /etc/stunnel ]; then
	if [ ! -r /etc/stunnel/$HOSTNAME.pem ]; then
		mv $HOSTNAME.pem /etc/stunnel && chmod 600 /etc/stunnel/$HOSTNAME.pem
		rm -f /etc/stunnel/stunnel.pem && ln -s /etc/stunnel/$HOSTNAME.pem /etc/stunnel/stunnel.pem 
	fi
	if [ ! -r /etc/stunnel/$HOSTNAME.pkcs7 ]; then
		mv $HOSTNAME.pkcs7 /etc/stunnel
	fi
	if [ ! -x /etc/stunnel/CA ]; then
		mkdir -p /etc/stunnel/CA && chmod 700 /etc/stunnel/CA
		mv ca.* /etc/stunnel/CA
	fi
fi


	fi

cd ..
rm -rf ssl.ca-0.1*
