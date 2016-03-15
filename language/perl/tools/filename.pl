#!/usr/bin/env perl 
#===============================================================================
#         FILE: filename.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/05/2014 09:10:59 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

for (@ARGV) {
	if ($_ =~ /\[.*\](.*)\[.*\].mobi/) {
#	if ($_ =~ /(.*).zip/) {
		my @lst = split / /, $1;
		my $newname = join '', @lst;
		$newname = $newname . '.mobi';
		say "newname = $newname";
		if ( -e $newname ) {
			warn "can not rename $_ to $newname: $newname exists\n";
		} elsif (rename $_ => $newname) {
		} else {
			warn "rename $_ to $newname failed: $!\n";
		}
	}
}


