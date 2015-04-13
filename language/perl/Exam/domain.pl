#!/usr/bin/env perl 
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/26/14 08:57:04
#      DESCRIPTION: Input: myfile. Sort the domain by times it occurs in decrease 
#      				order.
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;


my %hash1;
while (<>) {
	$_ =~ m{http://(.*)/.*};
	if (exists $hash1{$1}) {
		$hash1{$1} += 1;
	}
	else {
		$hash1{$1} = 1;
	}
}

my %hash2 = reverse %hash1;
foreach my $nu (reverse sort keys %hash2) {
	foreach my $key (sort keys %hash1) {
		if ($nu == $hash1{$key}) {
			say "$key => $hash1{$key}";
		}
	}
}
