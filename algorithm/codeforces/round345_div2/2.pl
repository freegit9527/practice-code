#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 2.pl
#
#  DESCRIPTION: B. Beautiful Paintings
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/17 21时31分48秒
#     REVISION: ---
#===============================================================================

#use strict;
#use warnings;
#use utf8;
#use List::MoreUtils qw(uniq);
#use 5.020;
$\ = $/;

while (<>) {
    my $a = [split ' ', <>];
    my ($h, $c, $ans) = ({}, {}, 0);
    $h->{$_}++ for @$a;
    for (keys %$h) {
        print "$_ -> $h->{$_}";
    }
}

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


