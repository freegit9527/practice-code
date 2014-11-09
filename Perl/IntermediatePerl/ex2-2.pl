#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex2-2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 11/09/2014 12:17:32
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Module::CoreList;
use ExtUtils::Installed;

my ($inst) = ExtUtils::Installed->new(skip_cwd => 1);
my (@modules) = $inst->modules();
for (@modules) {
	print "$_\t--\t";
	print Module::CoreList->first_release($_);
	print "\n";
}


