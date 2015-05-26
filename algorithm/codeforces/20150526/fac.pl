#!/usr/bin/env perl 
#===============================================================================
#         FILE: fac.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 11:32:17 AM
#===============================================================================

use strict;
use warnings;
use utf8;
sub fac {
    my $res = 1;
    my $n = shift;
    $res *= $n-- while $n;
    $res;
}
print fac(5);

