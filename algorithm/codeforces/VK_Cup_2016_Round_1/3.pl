#!/usr/bin/env perl 
#===============================================================================
#         FILE: 3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 03:35:05 PM
#===============================================================================

#use strict;
#use warnings;
#use utf8;

while (<>) {
    chomp;
    my $num = $_;
    my @array;
    while ($_ --) {
        my $line;
        chomp($line = <>);
        push @array, $line;
    }
    my $res = 6;
    my $success;
    my (@ara, @arb);
    for (0..$#array) {
        @ara = split '', $array[$_];
        for my $j (0..$#array) {
            next if ($j == $_);
            @arb = split '', $array[$j];
            my $cnt = 0;
            for (0..$#ara) {
                $cnt++ if $ara[$_] != $arb[$_];
            }
            my $tmp = int(($cnt + 1) / 2 - 1);
            $res = $tmp if $tmp < $res;
            $success = 1 if $res == 0;
            last if $success;
        }
        last if $success;
    }
    print $res, "\n";
}

exit 0;
