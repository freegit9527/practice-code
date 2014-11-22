#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex2-3.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 11/09/2014 15:58:37
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Business::ISBN;

my $isbn13 = Business::ISBN->new('978-7-5641-3888-2');
my $group_code = $isbn13->group_code();
my $publisher_code = $isbn13->publisher_code();
say "group_code = $group_code; publisher_code = $publisher_code";


