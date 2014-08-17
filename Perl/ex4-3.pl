#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ex4-3.pl
#
#        USAGE: ./ex4-3.pl  
#
#  DESCRIPTION: no
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 08/17/2014 03:50:25 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.010;

sub average
{
	my $sum = 0;
	foreach (@_)
	{
		$sum += $_;
	}
	$sum/@_;
}

sub above_average
{
	my $ave = &average(@_);
	my @res;
	foreach (@_) 
	{
		if ($ave < $_)
		{
			push @res, $_;
		}
	}
	@res;
}
my @fred = &above_average(1..10);
say "\@fred is @fred";
say "(Should be 6 7 8 9 10)";
my @barney = &above_average(100, 1..10);
say "\@barney is @barney";
say "(Should be just 100)";
