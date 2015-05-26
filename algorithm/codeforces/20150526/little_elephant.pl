#!/usr/bin/env perl 
#===============================================================================
#         FILE: little_elephant.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 07:38:44 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;
chomp(my $n = <STDIN>);
print join(" ", ($n, 1..($n-1)));
print "\n";

