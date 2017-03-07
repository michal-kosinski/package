#!/usr/bin/perl -w
use strict;

# ups-stats.pl by nate (mrtg@aphroland.org) http://howto.aphroland.de/HOWTO/MRTG
#
# Version 0.5 - Initial version.

# this script uses Network UPS Tools(NUT) to query a UPS system for
# graphing status in MRTG.

# location of upsc binary
my $upsc = "/usr/bin/upsc";

my $host;
my $name;
my $type;

if ( @ARGV ) {
	$host = $ARGV[0];
	$name = $ARGV[1];
	$type = $ARGV[2];
} else {
	print "Usage: ups-status.pl <host> <name> <type>\n";
	print "=========================================\n";
	print "<host> - hostname of system UPS is connected to\n";
	print "<name> - name of UPS as defined by NUT\n";
	print "<type> - battery or temperature or voltage\n";
	print "===============================================\n";
	print "Sample:\n";
	print "./ups-status.pl mail.aphroland.org apc1 battery\n";
	print "\n";
	print "This will connect to mail.aphroland.org, and query\n";
	print "the UPS named apc1 for the battery/load information\n";
	exit 1
}

open(UPS,"$upsc $name\@$host|") || die "Could not open ${upsc}: $!\n";
while (<UPS>) {
	if ( $type eq "battery" ) {
		print int($1) . "\n" if ( /^battery\.charge: (.*)/ );
		print int($1) . "\n" if ( /^ups\.load: (.*)/ );
	} elsif ( $type eq "temperature" ) {
		print int($1*1.8+32) . "\n" if ( /^ups\.temperature: (.*)/ );
		print int($1*1.8+32) . "\n" if ( /^ups\.temperature: (.*)/ );
	} elsif ( $type eq "voltage" ) {
		print int($1) . "\n" if ( /^input\.voltage: (.*)/ );
		print int($1) . "\n" if ( /^input\.voltage: (.*)/ );
	} else {
		die "Invalid status type selected: ${type}!\n";
	}
}
close(UPS) || warn "Could not close ${upsc}: $!\n";

