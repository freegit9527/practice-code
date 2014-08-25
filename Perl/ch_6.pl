#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch_6.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/24/14 21:30:23
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.010;

my %family_name;
$family_name{'fred'} = 'flintstone';
$family_name{'barney'} = 'rubble';

foreach my $person (qw <barney fred>) {
	print "I've heard of $person $family_name{$person}.\n";
}

my $foo = 'bar';
say $family_name{$foo . 'ney'};

$family_name{'wilma'} = 'flintstone';
$family_name{'barney'} .= $family_name{'barney'};

my %last_name = (
	fred => 'flintstone',
	dino => 'undef',
	barney => 'rubble',
	betty => 'rubble',
);

say $family_name{'bar' . 'ney'};
say $family_name{barney};

my %hash = (
	a => 1,
	b => 2,
	c => 3,
);
my @k = keys %hash;
my @v = values %hash;
say "keys = @k";
say "values = @v";

my $count = keys %hash;
say "There are $count key-value in hash!";

while (my ($key, $value) = each %hash) {
	print "$key => $value\n";
}
