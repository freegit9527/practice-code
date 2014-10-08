#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex14-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/08/14 15:26:35
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my %last_name = qw /
fred flintstone Wilma Flintstone Barney Rubble
betty rubble Bamm-Bamm Rubble PEFBBLES FLINTSTONE
/;

sub by_lastname {
	"\L$last_name{$a}" cmp "\L$last_name{$b}"
		or 
	"\L$a" cmp "\L$b";
}

my @results = sort by_lastname keys %last_name;
for (@results) {
	say "$last_name{$_}, $_";
}
