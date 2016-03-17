#!/usr/bin/env perl 
#===============================================================================
#         FILE: 3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 07:29:47 PM
#===============================================================================

#use strict;
#use warnings;
#use utf8;
use List::MoreUtils qw(uniq);
#use 5.020;
#use Hash::MultiKey;

$\ = $/;

while (<>) {
    my $num = $_;
    my $hash = undef;
    while ($num --) {
        my $line;
        chomp($line = <>);
        if ($line =~ /(http:\/\/[^\/]*)(.*)/) {
            push @{$hash->{$1}}, $2;
        }
    }
    for (keys %{$hash}) {
        @{$hash->{$_}} = uniq sort {$a cmp $b} @{$hash->{$_}};
#        hash = { 'http...' => [/ /test], 'http..abc' => [/ /test], ... }
    }

    my	%hash_str2str;
    my	%reverse_hash_str2str;
    for (keys %{$hash}) {
        $hash_str2str{$_} = join '', @{$hash->{$_}};
        # hash_str2str = { 'http:...' => '//test/aaa/bab', ...  }
        push @{$reverse_hash_str2str{$hash_str2str{$_}}}, $_;
        # reverse_hash_str2str = { '/test//aaa/abb' => ['http:/aba', 'http....'], ...  }
    }
    my @result;
    for (values %reverse_hash_str2str) {
        push @result, $_ if @{$_} > 1;
    }
    print scalar @result;
    for (0..$#result) {
        if (@{$result[$_]} > 1) { print"@{$result[$_]}"; }
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
    my $lena = @{$_[0]};
    my $lenb = @{$_[1]};
    return 0 if $lena != $lenb;
    for (0..$lena-1) { return 0 unless ($_[0][$_] eq $_[1][$_]); }
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
    my $lena = @{$_[0]};
    my $lenb = @{$_[1]};
    return 0 if $lena != $lenb;
    for (0..$lena-1) { return 0 unless ($_[0][$_] == $_[1][$_]); }
    return 1;
} ## --- end sub num_array_cmp


exit 0;

