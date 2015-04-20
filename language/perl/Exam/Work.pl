#!/usr/bin/env perl 
#===============================================================================
#         FILE: Work.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/20/2015 22:30:06
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

sub auth {
    my @ran = (0, 1);
    $ran[int(rand(2))];
}

while (<>) {
    chomp;
    s/\s+//;
    my @arr = (split / /);
    my $len = @arr;
    if ($len == 2) {
        if (auth($arr[0], $arr[1])) {
            say "OK";
        } else {
            say "ERR";
        }
    } else {
        if (auth($arr[0], $arr[1])) {
            print "OK ", $arr[-1], "\n";
        } else {
            print "ERR ", $arr[-1], "\n";
        }
    }
}

