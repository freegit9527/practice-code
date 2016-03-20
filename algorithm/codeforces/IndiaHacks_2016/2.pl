#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 2.pl
#
#  DESCRIPTION: B. Bear and Compressing
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/19 16时44分19秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

while (<>) {
    my ($n, $q) = split ' ';
    my %hsh;
    while ($q--) {
        my ($a, $b) = split ' ', <>;
        $a = (split '', $a)[0];
        push @{$hsh{$b}}, $a;
    }
    my $sum;
    my @array = qw(a);
    my @brrby;
    my $mark = 1;
    for (2..$n) {
        @brrby = ();
        for (@array) {
            push @brrby, @{$hsh{$_}} if $hsh{$_};
        }
        unless (@brrby) {
            $mark = 0; last;
        }
        @array = @brrby;
    }
    if ($mark) {
        print scalar @array;
    } else {
        print "0"
    }
}


exit 0;


