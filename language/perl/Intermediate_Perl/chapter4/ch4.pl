#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch4.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/19/2015 05:42:34 PM
#      ADDED: 03/12/2016 06:50:30 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

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

sub check_required_items_pre {
    my $who = shift;
    my %whos_items = map {$_, 1} @_;
    my @required = qw(preserver sunscreen water_bottle jacket);
    for (@required) {
        say "$who is missing $_" unless $whos_items{$_};
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
check_required_items_1('The skipper', \@skipper);
check_required_items_pre('The skipper', @skipper);

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
	my $who        = shift;
	my $items      = shift;
	my %whos_items = map {$_, 1} @$items;
	my @required   = qw (preserver sunscreen water_bottle jacket);
	my @missing    = ();
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

my @num           =  qw (first second);
my @lang          =  qw (c java perl python);
my @num_name      =  ('number' => \@num);
my @lang_name     =  ('language' => \@lang);

my @num_and_lang  =  (\@num_name, \@lang_name);
for my $i (@num_and_lang) {
	print "${$i}[0]: (@{${$i}[1]})";
}

sub check_required_items_3 {
    my %items_hash = map {$_, 1} @{$_[1]};
    my @required = qw (1 2 3 4 5 6);
    for (@required) {
        unless ($items_hash{$_}) {
            print "$_[0] is missing $_";
            # here $_[0] and $_ is not the same thing:
            # $_[0] is the first argument of the function,
            # $_ if the default loop variable of `for`
        }
    }
}

my $name      = "liuxueyang";
my @my_number = qw (2 5 7);
check_required_items_3($name, \@my_number);

my @liu_items          =  qw (1 2 3);
my @gu_items           =  qw (4 5 6);
my @song_items         =  qw (7 8 9);
my @liu_name_items     =  ('liu' => \@liu_items);
my @gu_name_items      =  ('gu' => \@gu_items);
my @song_name_items    =  ('song' => \@song_items);
my @all_name_items     =  (
    \@liu_name_items,
    \@gu_name_items,
    \@song_name_items
  );
for (@all_name_items) {
    say $$_[0], ': ';
    # &check_required_items_3($$_[0], $$_[1]);
    # or like this:
    &check_required_items_3(@$_);
}
