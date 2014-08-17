#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch_5.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/17/2014 04:47:06 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.010;
#while (<STDIN>) {
#	print "I saw $_";
#}
#
#foreach (<STDIN>) {
#	print "This is $_";
#}
@ARGV = qw / ch_2.pl /;
while (<>) {
	chomp;
	say "It was $_ that I saw";
}
