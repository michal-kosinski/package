#!/bin/sh

for a in `find $1 -name "*.php"` ; do
    echo encoding $a ;
    tmp=`mktemp` ;
    php -q /root/eaccelerator/encoder.php $a |sed '/^$/d'|grep -v "$a"|sed s/'<?php if (!is_callable(\"eaccelerator_load\") && !@dl((PHP_OS==\"WINNT\"||PHP_OS==\"WIN32\")?\"eloader.dll\":\"eloader.so\")) { die(\"This PHP script has been encoded with eAccelerator, to run it you must install <a href=\\\"http:\/\/eaccelerator.sourceforge.net\/\\\">eAccelerator or eLoader<\/a>\");} return '/'<?'/g|sed s/";?>"/"?>"/g > $tmp;
    mv $tmp $a ;
    chown 200.200 $a ;
done
