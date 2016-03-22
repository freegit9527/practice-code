#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 1.pl
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (liuxueyang.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/22 18时32分24秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

my $sum = 0;
for (1..1000-1) {
    if ($_ % 3 == 0 or $_ % 5 == 0) {
        $sum += $_;
    }
}
print $sum;
print int(sqrt(120)) + 1;

exit 0;


