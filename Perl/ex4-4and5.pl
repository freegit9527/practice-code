#!/usr/bin/perl
#===============================================================================
#
#         FILE: ex4-4.pl
#
#        USAGE: ./ex4-4.pl  
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
#      CREATED: 08/17/2014 03:57:15 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.010;

sub greet
{
	state $last_name;
	if (!$last_name) {
		say "Hi @_! You are the first one here!";
	} else {
		say "Hi @_! $last_name is also here!";
	}
	$last_name = shift;
}

&greet("Fred");
&greet("Barney");

#ex4-5
sub greet_1
{
	state @names;
	if (!@names)
	{
		say "Hi @_! You are the first one here!";
		push @names, @_;
	} else {
		say "Hi @_! I've seen: @names";
		push @names, @_;
	}
}

&greet_1("Fred");
&greet_1("Barney");
&greet_1("Wilma");
&greet_1("Betty");
