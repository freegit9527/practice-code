#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/14/2015 11:31:23 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @inputnumbers = (1..20);

print $_, " " for @inputnumbers;
say "";

my @odd_digit_nums = grep {
  my $sum;
  $sum += $_ for split //;
  $sum % 2;
} @inputnumbers;

say "";
print "odd_digit_nums are: @odd_digit_nums\n";


