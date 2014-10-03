#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex12-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/14 10:21:22
#      USAGE:   input filenames and output the oldest file and its modified time.
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

die "no input file name!" unless @ARGV;
my $res_name = shift @ARGV;
my @res_f_stat = stat($res_name);
my $res_f_time = $res_f_stat[-3];
for (@ARGV) {
	my @f_stat = stat;
	my $f_time = $f_stat[-3];
	($res_name, $res_f_time) = ($_, $f_time) if $f_time < $res_f_time;
}
my @read_f_time = localtime $res_f_time;
my ($sec, $min, $hour, $day, $mon, $year) =
		($read_f_time[0], $read_f_time[1], $read_f_time[2], $read_f_time[3], $read_f_time[4]+1, $read_f_time[5] + 1900);
say "The oldest file is $res_name, and it is created in $year/$mon/$day---$hour:$min:$sec";
