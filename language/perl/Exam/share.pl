#!/usr/bin/env perl 
#===============================================================================
#         FILE: share.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 06:01:03
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use threads::shared;

my $foo :shared = 1;
my $bar = 1;
threads->create(sub {$foo++; $bar++; })->join();

print("$foo\n");
print("$bar\n");


