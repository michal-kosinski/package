#!/bin/sh

#rm -rf /usr/libdata/perl5/CPAN/Config.pm* /root/.cpan

export FTP_PASSIVE=1
perl -MCPAN -e shell

# for RT: perl -MCPAN -e 'install Bundle::Apache2'
