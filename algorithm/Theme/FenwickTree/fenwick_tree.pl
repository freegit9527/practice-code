#!/usr/bin/env perl -n
#===============================================================================
#         FILE: fenwick_tree.pl
#       AUTHOR: Sabastian (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 2016/06/26 23时27分06秒
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

chomp;
my @fenwick;
my @array = split;
unshift @array, 0;
unshift @fenwick, 0;

sub lowbit { $_[0] & -$_[0]; }

sub build_fenwick_tree {
    for (1..$#array) {
        for my $j ($_-lowbit($_)+1..$_) {
            $fenwick[$_] += $array[$j]
        }
    }
}

sub modify_fenwick_tree {
    # two arguments
    # 1.index: the index of the array to modify
    # 2.delta: substract result of new value to the old value of the element
    my ($index, $delta) = @_;
    while ($index <= @fenwick) {
        $fenwick[$index] += $delta;
        $index += lowbit($index);
    }
}

sub sum_fenwick_tree {
    # 1 argument: index
    my ($ans, $i) = (0, $_[0]);
    while ($i > 0) {
        $ans += $fenwick[$i];
        $i -= lowbit($i);
    }
    $ans;
}


build_fenwick_tree();
print join(" ", @fenwick[1..$#fenwick]), "\n";

modify_fenwick_tree(3, 3);
print join(" ", @fenwick[1..$#fenwick]), "\n";

print sum_fenwick_tree(3), "\n";

# input
# 1 2 3 4 5
# output
# 1 3 3 10 5
# 1 3 6 13 5
# 9
#
