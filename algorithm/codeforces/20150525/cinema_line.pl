#!/usr/bin/env perl 
#===============================================================================
#         STDIN: cinema_line.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/25/2015 10:29:48 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

#open STDIN, "in.txt";
my (@a, %num);
while(<STDIN>) {
    chomp($_ = <STDIN>);
    undef %num;
    undef @a;
    @a = split;
    $num{25} = $num{50} = $num{100} = 0;
    my $mark = 0;
    for my $i (@a) {
        if ($i == 25) {
            $num{25}++;
        }
        elsif ($i == 50 && $num{25} >= 1) {
            $num{25}--;
            $num{50}++;
        }
        elsif ($i == 100) {
            if ($num{50} >= 1 && $num{25} >= 1) {
                $num{50}--;
                $num{25}--;
            }
            elsif ($num{25} >= 3) {
                $num{25} -= 3;
            }
            else {
                print "NO\n";
                $mark = 1;
                last;
            }
        }
        else {
            print "NO\n";
            $mark = 1;
            last;
        }
    }
    print "YES\n" if $mark == 0;
}


