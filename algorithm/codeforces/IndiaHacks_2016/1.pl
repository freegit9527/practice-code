#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 1.pl
#
#  DESCRIPTION: A. Bear and Three Balls
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/19 16时36分13秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;
use List::MoreUtils qw(uniq);

while (<>) {
    my @array = split ' ', <>;
    @array = uniq sort {$a <=> $b} @array;
    my $mark = 0;
    for (0..$#array-2) {
        if (($array[$_] + 1 == $array[$_+1]) and ($array[$_] + 2 == $array[$_+2])) {
            $mark = 1; last;
        }
    }
    if ($mark) {
        print "YES";
    } else {
        print "NO";
    }
}


exit 0;


