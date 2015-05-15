#!/usr/bin/env perl 
#===============================================================================
#         FILE: rotatelog.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/15/2015 11:15:04 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @date = localtime();
my $weekday = $date[6];

say "weekday = $weekday";
open DEBUG, "> debug.txt";
print DEBUG "hello";
