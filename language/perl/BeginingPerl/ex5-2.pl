#!/usr/bin/perl
#===============================================================================
#         FILE: ex5-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 08/24/14 20:48:48
#===============================================================================

use strict;
use warnings;
use utf8;
use autodie;
use 5.010;

print "Enter some lines, then press Ctrl-D:\n";
chomp(my @lines = <STDIN>);
print "1234567890" x 7, "12345\n";
foreach (@lines) {
	printf "%20s\n", $_;
}


