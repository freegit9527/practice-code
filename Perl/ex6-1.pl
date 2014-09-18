#!/usr/bin/perl
#===============================================================================
#         FILE: ex6-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/25/2014 15:50:44
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.010;

my %family_names = (
	Ikki => 'Phoenix',
	mu => 'Aries',
	xueyang => 'liu',
);

while (<>) {
	chomp;
	if (exists $family_names{$_}) {
		say "$_\'s family is $family_names{$_}";
	} else {
		say "$_ does not exists..=_=";
	}
}
