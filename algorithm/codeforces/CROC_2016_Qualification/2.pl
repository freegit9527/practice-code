#!/usr/bin/env perl 
#===============================================================================
#         FILE: 2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 05:42:26 PM
#===============================================================================

use strict;
use warnings;
use utf8;

while (<>) {
    my ($n, $b) = split;
    my @input;
    for my $i (0..$n-1) {
        my ($t, $d) = split ' ', <>;
        push @input, {t => $t, d => $d, p => $i};
    }
    my @res;
    push @res, $input[0]{t} + $input[0]{d};
    my $now = $res[0];
    shift @input;
    my $queue_remain = $b;
    my @queue;
    for (@input) {
        if ($_->{t} < $now and $queue_remain > 0) {
            push @queue, $_;
            $queue_remain++;
        }
    }
    print join ' ', @res;
    print "\n";
}

exit 0;
