#!/usr/bin/env perl 
#===============================================================================
#         FILE: d.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/19/14 20:30:59
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
my ($a, $b, $c, $k, $result);
chomp($c = <STDIN>);
($a, $k) = split / /, $c;
if ($k == 10) {
	$b = $a;
}
else {
	my @lst = ()[]
}
$result = $a - $b;
if ($result < 0) $result *= -1;
print "$a $k $b\n";
print "$result\n";
