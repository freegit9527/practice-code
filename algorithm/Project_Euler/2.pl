#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: 2.pl
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (liuxueyang.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/22 18时46分25秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

my ($a, $b, $sum) = (1, 2, 2);
while ($a <= 400_0000) {
    $a = $a + $b;
    $b = $a + $b;
    $sum += $a if ($a % 2 == 0 and $a <= 400_0000);
    $sum += $b if ($b % 2 == 0 and $b <= 400_0000);
}
print $sum;

exit 0;


