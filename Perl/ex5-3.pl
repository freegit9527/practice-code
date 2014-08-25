#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex5-3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/24/14 21:04:44
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.010;

print "What column width would you linke? ";
chomp(my $width = <STDIN>);

print "Enter some lines, then press Ctrl-D:\n";
chomp(my @lines = <STDIN>);

print "1234567890" x (($width + 9) / 10) . "12345", "\n";

foreach (@lines) {
	printf "%${width}s\n", $_;
}

