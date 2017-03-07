#!/bin/sh

if [ -x /usr/teTeX/texfonts ]; then
    TMP=`mktemp -d /usr/teTeX/texfonts.XXXXXX`
    mv /usr/teTeX/texfonts $TMP
fi
