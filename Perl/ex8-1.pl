#!/usr/bin/perl
#===============================================================================
#         FILE: ex8-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/06/14 09:35:41
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.010;
use autodie;

while (<>) {
	chomp;
	if (/match/) {
		say "Matched: |$`<$&>$'|";
	}
	else {
		say "No match: |$_|";
	}
}


