#!/usr/bin/env perl 
#===============================================================================
#         FILE: dreamoon_wifi.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 10:56:57 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

#chomp(my $drazil = <STDIN>);
#chomp(my $dreamoon = <STDIN>);
open DTDIN, "in.txt";
while (my $drazil = <DTDIN>) {
    chomp($drazil);
    chomp(my $dreamoon = <DTDIN>);
    my($zil_opp, $zil_neg, $oon_opp, $oon_neg, $oon_que);

    $zil_opp = $drazil =~ tr/+//;
    $zil_neg = $drazil =~ tr/-//;

    $oon_opp = $dreamoon =~ tr/+//;
    $oon_neg = $dreamoon =~ tr/-//;
    $oon_que = $dreamoon =~ tr/?//;

    my($goal, $now);

    $goal = $zil_opp - $zil_neg;
    $now = $oon_opp - $oon_neg;

    my $gap = abs($goal - $now);
    my $even = $z - $gap;
    if ($even < 0 || $even % 2 == 1) {
        printf("%1.16f\n", 0);
    } else {
    }

}

sub fac
{
    my $res = 1;
    my $n = shift;
    $res *= $n-- while $n;
    $res;
}
