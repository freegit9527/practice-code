#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: syntax.pl
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/19 17时01分20秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

my $a = "abcd";
my @b = split '', $a;
my @c = (1..5);
push @b, @c;
print "@b";


exit 0;


