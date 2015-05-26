#!/usr/bin/env perl 
#===============================================================================
#         STDIN: domino.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 09:15:44 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

#open STDIN, "in.txt";
while($_ = <STDIN>){
    chomp($_);
    my ($sumx, $sumy, $cnt) = (0, 0, 0);
    while($_--){
       chomp(my $ln = <STDIN>);
       my ($x, $y) = split / /, $ln;
       $sumx += $x; $sumy += $y;
       $cnt += 1 if (abs($x - $y) % 2 == 1);
    }
    if (($sumx + $sumy) % 2 == 0) {
        if ($sumx % 2 == 1 && $cnt > 0) {
            print "1\n";
        } elsif ($sumx % 2 == 0) {
            print "0\n";
        } else {
            print "-1\n";
        }
    } else {
        print "-1\n";
    }
}


