#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex12-3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/2014 04:22:30 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

say "Looking for my files that are readable and writeable";
die "No files specified!\n" unless @ARGV;

for (@ARGV) {
	say "$_ is readable and writeable" if -w -r -o $_;
}


