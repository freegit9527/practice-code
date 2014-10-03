#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch_12.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/14 09:55:16
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

for my $file (@ARGV) {
#	if (-r -w -e $file) {
#		say "'$file' is r and w and exists";
#	}
#	else {
#		say "'$file' can not be read and written.";
#	}
	my @f_stat = stat($file);
	my $f_ctime = $f_stat[-3];
	my @f_read_time = localtime($f_ctime);
	my ($sec, $min, $hour, $day, $mon, $year) = ($f_read_time[0], $f_read_time[1], $f_read_time[2], $f_read_time[3], 
		$f_read_time[4] + 1, $f_read_time[5] + 1900);
#	say "sec = $sec, min = $min, hour = $hour, day = $day, mon = $mon, year = $year";
	say "$year:$mon:$day---$hour:$min:$sec";
}


