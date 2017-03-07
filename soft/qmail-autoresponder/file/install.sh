#!/bin/sh

if [ ! -x /var/qmail/autoresponder ]; then
	mkdir -p /var/qmail/autoresponder
	chown -R alias.qmail /var/qmail/autoresponder
fi

if [ ! -x /var/qmail/autoresponder/autor-01 ]; then
	mkdir -p /var/qmail/autoresponder/autor-01

	echo 'From: Autoresponder <autoresponder@foo.bar.com>
Subject: Re: %S [automatic reply]

Message body.

-- 
Signature' > /var/qmail/autoresponder/autor-01/message.txt

fi

if [ ! -r /var/qmail/alias/.qmail-foobarcom-autoresponder ]; then

	echo '|/var/qmail/bin/qmail-autoresponder -q -n 10 /var/qmail/autoresponder/autor-01
autor-01' > /var/qmail/alias/.qmail-foobarcom-autoresponder

fi

