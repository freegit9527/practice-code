#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: segment_tree.pl
#
#  DESCRIPTION: segment tree in perl
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/17 20时31分08秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;
my  $n = 5;
my  @tree;
my  @num = (1..$n);
$tree[1] = { l => 1, r => $n};
create_tree(\@tree, 1);

sub create_tree {
    my  ( $tree, $pos ) = @_;
    my  ( $l, $r ) = ($tree[$pos]->{l}, $tree[$pos]->{r});
    #print "<$l, $r>, $pos";
    return $l if ($l == $r);
    my  $mid = int(($l + $r) / 2);
    $tree[$pos * 2] = { l => $l, r => $mid };
    $tree[$pos * 2 + 1] = { l => $mid + 1, r => $r };
    create_tree($tree, $pos * 2);
    create_tree($tree, $pos * 2 + 1);
}
#print scalar @tree;
for (1..$#tree) {
    print "<$tree[$_]->{l}, $tree[$_]->{r}>, $_";
}

#for (@tree) {
#    print "$_->{l}, $_->{r}";
#}

#===  FUNCTION  ================================================================
#         NAME: str_array_in_array_of_array
#      PURPOSE: find if an array is equal to one of a array of arrays
#   PARAMETERS: two array reference
#      RETURNS: return 1 if find an equal array, 0 otherwise
#  DESCRIPTION: all arrays are array of strings
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub str_array_in_array_of_array {
    my ($small_ar, $ar_ar) = @_;
    my $mark = 0;
    for (@{$ar_ar}) {
        $mark = 1;
        unless (str_array_cmp($small_ar, $_)) {
            $mark = 0;
            next;
        }
        last if $mark;
    }
    $mark;
}

#===  FUNCTION  ================================================================
#         NAME: num_array_in_array_of_array
#      PURPOSE: find if an array is equal to one of a array of arrays
#   PARAMETERS: two array reference
#      RETURNS: return 1 if find an equal array, 0 otherwise
#  DESCRIPTION: all arrays are array of numbers
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub num_array_in_array_of_array {
    my ($small_ar, $ar_ar) = @_;
    my $mark = 0;
    for (@{$ar_ar}) {
        $mark = 1;
        unless (num_array_cmp($small_ar, $_)) {
            $mark = 0;
            next;
        }
        last if $mark;
    }
    $mark;
}

#===  FUNCTION  ================================================================
#         NAME: str_array_cmp
#      PURPOSE: compare two array of strings
#   PARAMETERS: two array reference
#      RETURNS: return 1 if two array are equal, 0 otherwise
#  DESCRIPTION: ????
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub str_array_cmp {
    return 0 if @{$_[0]} != @{$_[1]};
    my $len = @{$_[0]};
    for (0..$len-1) { return 0 unless ($_[0][$_] eq $_[1][$_]); }
    return 1;
} ## --- end sub str_array_cmp

#===  FUNCTION  ================================================================
#         NAME: num_array_cmp
#      PURPOSE: compare two array of numbers
#   PARAMETERS: two array reference
#      RETURNS: return 1 if two array are equal, 0 otherwise
#  DESCRIPTION: ????
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub num_array_cmp {
    return 0 if @{$_[0]} != @{$_[1]};
    my $len = @{$_[0]};
    for (0..$len-1) { return 0 unless ($_[0][$_] == $_[1][$_]); }
    return 1;
} ## --- end sub num_array_cmp

exit 0;


