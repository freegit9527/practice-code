#!/usr/bin/perl
#===============================================================================
#
#         FILE: ex4-1.pl
#
#        USAGE: ./ex4-1.pl  
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
#      CREATED: 08/17/2014 03:43:55 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.010;

sub total
{
	my $sum = 0;
	foreach (@_)
	{
		$sum += $_;
	}
	$sum;
}
my @fred = qw / 1 3 5 7 9 /;
my $fred_total = &total(@fred);
say "The total of \@fred is $fred_total.";
print "Enter some numbers on separate lines: ";
my $user_total = &total(<STDIN>);
say "The total of those numbers is $user_total.";

# ex4-2
my $res = &total(1..1000);
say "res = $res";
