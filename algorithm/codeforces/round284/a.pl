#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: a.pl
#
#        USAGE: ./a.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 1/14/2015 8:02:38 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

chomp($_ = <STDIN>);
my ($n, $x) = split(/ /, $_);
my @time;
while (<>) {
	chomp;
	my ($l, $r) = split(/ /);
	push(@time, $l);
	push(@time,$r);
}
my ($now, $sum);
$now = 1; $sum = 0; 
while (1) {
	my $l = shift @time;
	my $r = shift @time;
	while (1) {
		if ($now + $x > $l) {
			$sum += ($r - $now + 1);
			$now = $r + 1;
			last;
		}
		else {
			$now += $x;
		}
	}
	if ( scalar @time == 0 ) {
		last;
	}
}
print "$sum\n";


