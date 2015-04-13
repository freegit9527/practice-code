#!/usr/bin/perl
#===============================================================================
#         FILE: ch_7.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/25/2014 17:08:51
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.014;

$_ = "alibaba";
if (/ali/) {
	say "matches.";
}

$_ = "a real \\ backslash";
if (/\\/) {
	say "It matches backslash";
}

$_ = "xaa11bb";
if (/(.)(.)\g{-1}11/) {
	say "It matched.";
}

my $original = 'Fred ate 1 rib';
my $copy = $original =~ s/\d+ ribs?/10 ribs/r;
say "original = $original";
say "copy = $copy";

$copy =~ s/(fred|rib)/\U\1/gi;
say "copy = $copy";

$copy =~ s/(fred|rib)/\L\1/gi;
say "copy = $copy";
