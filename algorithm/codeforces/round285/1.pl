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

chomp(my $n = <STDIN>);

my %name;
while ( $n-- ) {
	chomp($_ = <STDIN>);
	my ($old, $new) = split(/ /);
	if ( exists($name{$old}) ) {
		my $origin = $name{$old};
		delete $name{$old};
		$name{$new} = $origin;
	}
	else {
		$name{$new} = $old;
	}
}
my $size = keys %name;
print "$size\n";
for my $key (keys %name) {
	print "$name{$key} $key\n";
}
