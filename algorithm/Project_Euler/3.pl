#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 3.pl
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (liuxueyang.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/22 19时25分26秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

my $n = 6008_5147_5143;
my @is_prime;
my @prime;
my $m = int($n/2) + 1;
for (2..$m) {
    $is_prime[$_] = 1;
}
for (2..$m) {
    if ($is_prime[$_] == 1) {
        for (my $j = $_ * 2; $j <= $m; $j += $_) {
            $is_prime[$j] = 0 if $is_prime[$j];
        }
    }
}
for (2..$m) {
    push @prime, $_ if ($is_prime[$_] == 1);
}
#print join ' ', @prime;
for (my $i = $#prime; $i >= 0; $i--) {
    if ($n % $prime[$i] == 0) {
        print $prime[$i];
        last;
    }
}

exit 0;

