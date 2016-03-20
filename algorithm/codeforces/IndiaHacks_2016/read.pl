#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: read.pl
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Lpaste (yesterday2young.github.io), liuxueyang457@163.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2016/03/20 20时31分28秒
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
#use 5.020;
$\ = $/;

open STDIN, '<', '3';
my $line = [split ' ', <>];
print scalar @{$line};
print $line;


exit 0;


