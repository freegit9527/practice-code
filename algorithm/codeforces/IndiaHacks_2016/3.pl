#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 3.pl
#
#  DESCRIPTION: C. Bear and Up-Down
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/20 07时40分42秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

my @bad_index;
my @mark_index;
my @lne;
my $n;
while (<>) {
    $n = $_; 
    @lne = split ' ', <>;
    unshift @lne, 0;
    @bad_index = ();
    for (1..$n) { $mark_index[$_] = 0; }
    for (1..$n) {
        unless (pos_is_nice($_)) {
            push @bad_index, $_;
            $mark_index[$_] = 1;                # 1 is bad
        }
    }
    my $result = 0;
    if (@bad_index > 10) {
        print "0";
    } else {
        for my $bad (1..$n) {
            if ($mark_index[$bad] == 1) {
                for (1..$n) {
                    if (($_ > $bad) or ($mark_index[$_] == 0)) {
                        if (swap_bad_and_other($bad, $_)) {
                            $result++;
                        }
                    }
                }
            }
        }
        print $result;
    }
}

sub swap_bad_and_other {
    my ($bad, $other) = @_;
    ($lne[$bad], $lne[$other]) = ($lne[$other], $lne[$bad]);
    my $mark = 1;
    if (pos_is_nice($bad) and pos_is_nice($other) and 
        pos_is_nice($bad + 1) and pos_is_nice($other + 1) and 
        pos_is_nice($bad - 1) and pos_is_nice($other - 1)) {
        for (@bad_index) {
            unless (pos_is_nice($_)) {
                $mark = 0;
                last;
            }
        }
    } else {
        $mark = 0;
    }
    ($lne[$bad], $lne[$other]) = ($lne[$other], $lne[$bad]);
    $mark;
}

sub pos_is_nice {
    my $pos = shift;
    return 1 if (($pos < 1) or ($pos > $n));
    if ($pos % 2 == 1) {
        # odd
        (($pos == 1) or ($lne[$pos] < $lne[$pos-1]))
            and (($pos == $n) or ($lne[$pos] < $lne[$pos+1]))
    } else {
        # even
        ($lne[$pos] > $lne[$pos-1])
            and (($pos == $n) or ($lne[$pos] > $lne[$pos+1]))
    }
}

exit 0;

