#!/usr/bin/env perl 
#===============================================================================
#         FILE: theatre.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/25/2015 07:53:32 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;
use bigint;

chomp($_ = <STDIN>);
my ($n, $m, $a) = split;
print cal($n,$a)*cal($m,$a) . "\n";

sub cal {
    my ($m, $a) = @_;
    int($m / $a) + ($m % $a == 0 ? 0 : 1);
}


