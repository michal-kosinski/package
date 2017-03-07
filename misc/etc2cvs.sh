#!/bin/sh

DIRS=`mktemp -d /tmp/_dirs.XXXXXXXXXX`
CVSROOT="/cvs"
HOST=`hostname`
STARTPWD=`pwd`
IMPORTDIR="/etc"

rm -rf $DIRS
mkdir -p $DIRS

cd $DIRS

if cvs co etc_$HOST ; then

  cd etc_$HOST/..
  mv etc_$HOST/CVS .
  rm -rf etc_$HOST/*
  mv CVS etc_$HOST/
  
  
  find /etc -type d -exec mkdir -p etc_$HOST/{} \;
  find /etc -type f -exec cp -p {} etc_$HOST/{} \;
  mv etc_$HOST/etc/* etc_$HOST/
  rm -rf etc_$HOST/etc
  
  cd etc_$HOST
  find . -exec cvs add {} \;
  
  cvs com -m "changed `date`"
  rm -rf $DIRS
else
  mkdir etc
  cd etc
  cvs import -m "initial import" etc_$HOST auto auto_

  rm -rf $DIRS
  echo Please rerun etc2cvs.sh
fi

