#!/usr/bin/env perl 
#===============================================================================
#         FILE: 2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/14/2015 11:18:24 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

my ($a, $b, $c, $d, $misha, $vasya);
$_ = <STDIN>;
($a, $b, $c, $d) = split(/ /, $_);
$misha = MAX(3 * $a / 10, $a - $a / 250 * $c);
$vasya = MAX(3 * $b / 10, $b - $b / 250 * $d);
if ($misha > $vasya) {print "Misha\n";}
elsif ($misha == $vasya) {print "Tie\n";}
else {print "Vasya\n";}
sub MAX {
	my ($a, $b) = @_;
	return $a if $a > $b; $b;
}
