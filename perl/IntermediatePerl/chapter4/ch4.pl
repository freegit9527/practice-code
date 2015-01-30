#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch4.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/19/2015 05:42:34 PM
#===============================================================================

use strict;
use warnings;
use utf8;
$\ = $/;
my @required = qw (
	preserver
	sunscreen
	water_bottle
	jacket);

my %skipper = map {$_, 1} qw (
	blue_shirt
	hat
	jacket
	preserver
	sunscreen);

for my $item (@required) {
	unless ($skipper{$item}) {
		print "Skipper is missing $item.\n";
	}
}

sub check_required_items {
	my $who = shift;
	my $items = shift;
	my %whos_items = map {$_, 1} @{$items};
	my @required = qw (
		preserver
		sunscreen
		water_bottle
		jacket);
	for my $item (@required) {
		unless ($whos_items{$item}) {
			print "$who is missing $item.\n";
		}
	}
}
my @skipper = qw (
	blue_shirt
	hat
	jacket
	preserver
	sunscreen);
check_required_items_2('The skipper', \@skipper);

my @professor = qw (sunscreen water_bottle slide_rule 
	batteries radio);
check_required_items_2('Professor', \@professor);

my @gilligan = qw (red_shirt hat lucky_socks water_bottle);
check_required_items_2('Gilligan', \@gilligan);

sub check_required_items_1 {
	my ($who, $items) = @_;
	my %whos_items = map{$_, 1} @$items;
	my @required = qw (
		preserver
		sunscreen
		water_bottle
		jacket);
	for my $item (@required) {
		unless ($whos_items{$item}) {
			print "$who is missing $item\n";
		}
	}
}

sub check_required_items_2 {
	my $who = shift;
	my $items = shift;
	my %whos_items = map {$_, 1} @$items;
	my @required = qw (preserver sunscreen water_bottle jacket);
	my @missing = ();
	for my $item (@required) {
		unless ($whos_items{$item}) {
			print "$who is missing $item.\n";
			push @missing, $item;
		}
	}
	if (@missing) {
		print "Adding @missing to @$items for $who.\n";
		push @$items, @missing;
	}
}
