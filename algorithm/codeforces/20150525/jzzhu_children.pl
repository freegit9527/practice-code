#!/usr/bin/env perl 
#===============================================================================
#         FILE: jzzhu_children.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/25/2015 09:44:37 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

my ($n, $m, @a, @pos);
while(<STDIN>)
{
    chomp;
    undef @a;
    undef @pos;
    ($n, $m) = split;
    $_ = <STDIN>;
    my $in = 1;
    for my $i (split) {
        push @a, $i;
        push @pos, $in;
        $in++;
    }
    while ($#pos > 0) {
        my $h = shift @a;
        if ($h <= $m) {
            shift @pos;
        } else {
            push @a, $h - $m;
            my $tmp = shift @pos;
            push @pos, $tmp;
        }
    }
    print "$pos[-1]\n";
}


