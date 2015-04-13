#!/usr/bin/perl
#===============================================================================
#         FILE: ex6-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/25/2014 15:57:20
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.010;

# input fred barney fred dino wilma fred 

my (%name_times, $name, @words);
chomp(@words = <STDIN>);
foreach my $word (@words) {
	$name_times{$word} += 1;
}
#while (<>) {
#	chomp;
#	$name_times{$_} += 1;
#}

foreach $name (sort keys %name_times) {
	say "$name => $name_times{$name}";
}

