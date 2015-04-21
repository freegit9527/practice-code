#!/usr/bin/env perl 
#===============================================================================
#         FILE: arr.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 09:39:25 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use List::Priority;

my @arr = (1, 2, 3, 4, 5);
my $len = @arr;
print("@arr\n");
print("size of arr = $len\n");

delete $arr[0];

print("@arr\n");
print("size of arr = $len");

