#!/usr/bin/env perl 
#===============================================================================
#         FILE: seperate.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/14/2015 11:00:24 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

$\ = $/;
my ($n, $x) = split " ", <>;

$_ = <>;
my $sum;
$sum += $2 - $1 + 1 while /(\d+) (\d+)/g;
print "sum = $sum\n";

print "Hello", "eheh";
