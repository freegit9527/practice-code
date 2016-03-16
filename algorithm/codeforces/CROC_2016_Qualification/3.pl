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
            if (array_cmp($_, $hash->{$j})) {
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
        push @result, $_ unless (in_result($_, \@result));
    }
    my $cnt;
    for (@result) {
        $cnt++ if (@{$_} > 1);
    }
    print "$cnt\n";
    for (@result) {
        if (@{$_} > 1) {
            print join ' ', @{$_};
            print "\n";
        }
    }
}

sub in_result {
    my ($small_ar, $ar_ar) = @_;
    my $mark = 0;
    for (@{$ar_ar}) {
        $mark = 1;
        my $lena = @{$_};
        my $lenb = @{$small_ar};
        unless ($lena == $lenb) {
            $mark = 0;
            next;
        }
        for my $index (0..$lena-1) {
            unless ($small_ar->[$index] eq $_->[$index]) {
                $mark = 0;
                last;
            }
        }
        last if $mark;
    }
    $mark;
}

sub array_cmp {
    my ($ar, $br) = @_;
    my $mark = 1;
    my $lena = @{$ar};
    my $lenb = @{$br};
    return 0 if $lena != $lenb;
    for (0..$lena-1) {
        unless ($ar->[$_] eq $br->[$_]) {
            return 0;
        }
    }
    $mark;
}

exit 0;
