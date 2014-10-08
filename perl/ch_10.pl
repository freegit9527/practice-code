#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch_10.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/2014 04:57:27 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

my ($total, $valid, %count);
while (<>) {
	for (split) {
		$total++;
		next if /\W/;
		$valid++;
		$count{$_}++;
	}
}

say "total things = $total, valid words = $valid";
for (sort keys %count) {
	say "$_ was seen $count{$_} times.";
}

