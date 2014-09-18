#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex11-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/15/14 21:57:15
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $magicnumber = int(1+rand 100);

while (<>) {
	chomp;
	last if $_ == $magicnumber || $_ =~ /quit|exit|^$/i ;
	$_ > $magicnumber ? say "Too high!" : say "Too low!";
}


