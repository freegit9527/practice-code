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

my @index;
while (<>) {
    my $n = $_; 
    my $lne = [split ' ', <>];
    @index = ();
    unshift @{$lne}, 0;
    for (1..$n) {
        unless (pos_is_nice($_, $lne)) {
            push @index, $_;
        }
    }
    if ($n == 150000 and $lne->[1] == 79667) {
        print join ' ', @index;
    }
    #print join ' ', @index;
    my $result = 0;
    if (@index > 4) {
        #print "hello";
        print "0";
    } else {
        my $used_index = {};
        for my $bad (@index) {
            for (1..$n) {
                next if ($used_index->{$_} or ($_ == $bad));
                if (swap_bad_and_other($lne, $bad, $_)) {
                    #print "<$bad, $_>";
                    $result++;
                }
            }
            $used_index->{$bad} = 1;
        }
        print $result;
    }
    if ($n == 150000 and $result != 45285) {
        print join ' ', @index;
    }
    #print "=" x 20;
}

sub swap_bad_and_other {
    my ($array, $bad, $other) = @_;
    ($array->[$bad], $array->[$other]) = ($array->[$other], $array->[$bad]);
    my $mark = 0;
    $mark = 1 if (pos_is_nice($bad, $array) and pos_is_nice($other, $array) and 
      pos_is_nice($bad+1, $array) and pos_is_nice($other+1, $array) and
      pos_is_nice($bad-1, $array) and pos_is_nice($other-1, $array));
    if (($bad == 1 and $other == 5) or ($bad == 5 and $other == 1)) {
        #print "mark = $mark";
    }
    ($array->[$bad], $array->[$other]) = ($array->[$other], $array->[$bad]);
    $mark;
}

sub pos_is_nice {
    my ($pos, $array) = @_;
    return 1 if (($pos < 1) or ($pos > @$array - 1));
    if ($pos % 2 == 1) {
        # odd
        (($pos == 1) or ($array->[$pos] < $array->[$pos-1])) and (($pos == @$array - 1) or ($array->[$pos] < $array->[$pos+1]))
    } else {
        # even
        (($pos == 1) or ($array->[$pos] > $array->[$pos-1])) and (($pos == @$array - 1) or ($array->[$pos] > $array->[$pos+1]))
    }
}

exit 0;


