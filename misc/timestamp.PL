#!/usr/bin/perl

$file = shift;
$write_secs = (stat($file))[9];
printf scalar $write_secs;
