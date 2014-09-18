#!/usr/bin/perl
#===============================================================================
#         FILE: ex8-5.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/06/14 10:08:47
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

while (<>) {
	chomp;
	if (/\s\z/) {
		say "$_#";
	}
#	if (/(?<ikki>\s+\z)/) {
#		say "'$_' Matched: '$+{ikki}'";
#	}
	else {
		say "Not Matched: <$_>";
	}
}


