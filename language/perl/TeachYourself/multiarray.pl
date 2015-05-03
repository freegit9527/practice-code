#!/usr/bin/env perl 
#===============================================================================
#         FILE: multiarray.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/03/2015 11:38:47 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $line = ['solid',
'black',
['1', '2', '3',
['4,', '5', '6']]];

print "\$line->[0] = $line->[0]\n";
print "\$line->[1] = $line->[1]\n";
print "\$line->[2][0] = $line->[2][0]\n";


