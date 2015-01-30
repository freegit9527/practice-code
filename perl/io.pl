#!/usr/bin/env perl 
#===============================================================================
#         FILE: io.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/14/2015 05:05:33 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

open(DATA, "<file.txt") or die "can not open file $!";

while ( <DATA> ) {
	chomp;
	my ($a, $b) = split(/ /);
	print "$a, $b\n";
}


