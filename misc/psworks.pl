#!/usr/bin/perl
use Date::Manip;

$pfile = "/tmp/psworks";
if ( -s $pfile ) {
$uid = `/usr/xpg4/bin/id -un`;
chop $uid ;
$cmd = "grep $uid /tmp/psworks" ;
$pass = `$cmd` ;

($id, $type, $date, $min, $max, $warn) = split " ", $pass ;
($m1, $d1, $y1) = split "/", $date ;
$y1 = "20"."$y1";
($m2, $d2, $y2) = split "/", &UnixDate("today","%m/%d/%Y");

$days1 = Date_DaysSince1BC($m1, $d1, $y1);
$days2 = Date_DaysSince1BC($m2, $d2, $y2);
$days = $max - ($days2 - $days1);
if ( $days>0 ) {
if ( $days<10 ) { $days = " ".$days ; }

print "\n***************************************************\n";
print "*     YOUR PASSWORD WILL EXPIRE IN $days DAY(S)      *\n";
print "***************************************************\n\n";
}
}
