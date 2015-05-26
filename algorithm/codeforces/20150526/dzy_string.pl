#!/usr/bin/env perl 
#===============================================================================
#         STDIN: dzy_string.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 09:44:35 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.012;

#open STDIN, "in.txt";
chomp(my $str = <STDIN>);
my @st = split //, $str;
chomp(my $cnt = <STDIN>);
chomp($_ = <STDIN>);
my @alph = split;
my %value;
while (my ($inde, $val) = each @alph){
    $value{chr($inde + ord('a'))} = $val;
}
my $sum = 0;
while (my ($inde, $val) = each @st){
    $sum += ($inde + 1) * $value{$val};
}
my @sor_alph = sort {$b <=> $a} @alph;
my $len = @st;
while ($cnt) {
    $sum += $sor_alph[0] * ($len + $cnt);
    $cnt--;
}
print $sum . "\n";

