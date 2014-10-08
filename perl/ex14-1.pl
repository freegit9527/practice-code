#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex14-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/08/2014 12:40:37 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @numbers;
push @numbers, split while <>;
say "@numbers";
for (sort {$a <=> $b} @numbers) {
	printf "%15g\n", $_;
}
