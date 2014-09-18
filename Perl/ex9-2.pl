#!/usr/bin/perl
#===============================================================================
#         FILE: ex10-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/11/14 09:51:38
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

my $in = $ARGV[0];
defined $in or die "Usage: $0 filename";
my $out = $in =~ s/(\.\w+)*$/.out/r;
open my $in_fn, '<', $in or die "Can not open '$in': $!";
open my $out_fn, '>', $out or die "Can not write '$out': $!";
while (<$in_fn>) {
	chomp;
	s/fred/\n/gi;
	s/wilma/fred/gi;
	s/\n/wilma/gi;
	print $out_fn "$_\n";
}
