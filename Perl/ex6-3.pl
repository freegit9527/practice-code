#!/usr/bin/perl
#===============================================================================
#         FILE: ex6-3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/25/2014 16:02:11
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.010;

my $longest = 0;
foreach my $tmp (keys %ENV) {
	my $key_length = length($tmp);
	$longest = $key_length if $key_length > $longest;
}

foreach my $tmp (sort keys %ENV) {
	printf "%-${longest}s  %s\n", $tmp, $ENV{$tmp};
}


