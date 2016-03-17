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
#        hash = {
#         'http...' => [/ /test],
#         'http..abc' => [/ /test],
#         ...
#        }
    }
    my $res;
    for (values %{$hash}) {
        for my $j (keys %{$hash}) {
            if (str_array_cmp($_, $hash->{$j})) {
                push @{$res->{$_}}, $j;
#                res:
#                 {
#                   array_ref => ['http://', http://...],
#                   ...
#                 }
            }
        }
    }
    my @result;
    for (values %{$res}) {
        unless (str_array_in_array_of_array($_, \@result)) {
            push @result, $_ if @{$_} > 1;
        }
    }
    print scalar @result, "\n";
    for (0..$#result) {
        if (@{$result[$_]} > 1) { print_array($result[$_]); }
    }
}

sub print_array { print join ' ', @{@_[0]}, "\n"; }

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

sub str_array_cmp {
    my $lena = @{$_[0]};
    my $lenb = @{$_[1]};
    return 0 if $lena != $lenb;
    for (0..$lena-1) { return 0 unless ($_[0][$_] eq $_[1][$_]); }
    1;
}

exit 0;

