#!/usr/bin/env perl 
#===============================================================================
#         FILE: watermelon.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/25/2015 09:16:37 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

chomp(my $w = <STDIN>);
print $w >= 4 && $w % 2 == 0 ? "YES" : "NO";
print "\n";

