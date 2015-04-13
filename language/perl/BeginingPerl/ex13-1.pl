#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex13-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/2014 08:38:59 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

chomp(my $dir = <STDIN>);
if ($dir =~ /\A\s*\Z/) {
	chdir or die "Cannot not enter home directory: $!";
}
else {
	chdir $dir or die "Cannot not change into the directory: $!";
}
#for (sort <* .*>) {
#	say "$_";
#}

opendir my $DIR, "." or die "Cannot open dir $dir: $! ";
for (sort readdir $DIR) {
	say "$_" unless /\A\./;
}
