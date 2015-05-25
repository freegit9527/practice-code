#!/usr/bin/env perl 
#===============================================================================
#         FILE: Hash_perl.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/15/2015 05:19:16 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

use vars qw(%blocked);

my @lst = (1, 2, 3, 4);

for my $i (@lst)
{
    $blocked{$i}{sleep} = 10;
    $blocked{$i}{block} = 20;
    $blocked{$i}{last} = 30;
}

for my $k (keys %blocked) 
{
    print "$k ==> $blocked{$k}{sleep}\n";
    print "$k ==> $blocked{$k}{block}\n";
    print "$k ==> $blocked{$k}{last}\n";
}

print "*" x 30 . "\n";

say "";

my %t_k;

$t_k{1}{app} = 100;
$t_k{2}{app} = 200;

for my $k (keys %t_k) 
{
    print "$k ==> $t_k{$k}\n";
    print "$k ==> $t_k{$k}{app}\n";
    $t_k{$k}{app} = 0;
    print "$k ==> $t_k{$k}{app}\n";
}

say "";

for my $k (keys %t_k) 
{
    print "$k ==> $t_k{$k}{app}\n";
}

say "";


$t_k{lst} = [1, 2, 3, 4, 5];

print "len = $#{$t_k{lst}} + 1\n";

my %new_ha;

$new_ha{ha} = 0;

print "$new_ha{ha}\n";

if ($new_ha{ha}) {
    print "0 is true";
}
else {
    print "0 is false";
}
say "";

if ($new_ha{SUNDAY}) {
    print "SUNDAY exists.\n";
}
else {
    print "SUNDAY does not exist.\n";
}

my ($a, $b);

($a, $b) = (-1, 2);

$b = $a + 1 || 1;

print "b = $b\n";
