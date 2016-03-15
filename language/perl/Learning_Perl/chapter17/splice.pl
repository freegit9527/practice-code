#!/usr/bin/env perl 
#===============================================================================
#         FILE: splice.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 20:11:51
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $fn;
open $fn, "book";
my $fmt = "%-10s %-10s\n";
printf $fmt, "cardnum", "count";
while (<$fn>) {
    chomp;
    my ($cardnum, $count) = (split /:/)[1, 5];
    printf $fmt, $cardnum, $count;
}



