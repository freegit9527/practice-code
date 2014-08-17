#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ex3-2.pl
#
#        USAGE: ./ex3-2.pl  
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
#      CREATED: 08/16/2014 09:55:18 PM
#     REVISION: ---
#===============================================================================

#use strict;
use warnings;
use utf8;
use 5.010;

@people = qw /
	fred
	betty
	barney
	dino
	wilma
	pebbles
	bamm-bamm
	/;

$num=1;
while (defined($num)) 
{
	$num=undef;
	$num = <STDIN>;
	if (defined($num)) {
		chomp($num);
		print "$people[$num-1]\n";
	}
}


