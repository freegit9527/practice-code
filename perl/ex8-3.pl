#!/usr/bin/perl
#===============================================================================
#         FILE: ex8-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/06/14 09:43:01
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

while (<>) {
	chomp;
	if (/(?<ikki>\b\w*a\b)(?<mu>.{0,5})/) {
#	if (/(?<ikki>\b\w+a\b)(?<mu>[\d\D]{0,5})/) {
		say "'$_' contains '$+{ikki}'";
		say "Five chars are: <$+{mu}>";
#		say "Matched: |$`<$&>$'|";
	}
	else {
		say "Not Matched: |$_|";
	}
}


