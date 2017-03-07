<?

$day = 1; // Day
$month = 11; // Month
$year = 2008; // Year

if ($month == 1) $month_name= "January";
if ($month == 2) $month_name= "February";
if ($month == 3) $month_name= "March";
if ($month == 4) $month_name= "April";
if ($month == 5) $month_name= "May";
if ($month == 6) $month_name= "June";
if ($month == 7) $month_name= "July";
if ($month == 8) $month_name= "August";
if ($month == 9) $month_name= "September";
if ($month == 10) $month_name= "October";
if ($month == 11) $month_name= "November";
if ($month == 12) $month_name= "December";

print ("OpenBSD 4.4 release in " . (int)((mktime (0,0,0,$month,$day,$year) - time(void))/86400) ." days.\n\n");

?>
