#!/usr/bin/env perl 
#===============================================================================
#         FILE: exercise_1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 2016/03/14 16时52分38秒
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

print map {
  (" " x 4) . $_ . "\n"
} grep { (-f) and ((-s) < 1000) } @ARGV;
