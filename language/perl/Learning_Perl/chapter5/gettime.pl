#!/usr/bin/env perl 
#===============================================================================
#         FILE: gettime.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 09:36:31 AM
#      试验一个perl程序调用另外一个perl程序
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Time::Piece;

my $t = localtime;
say join '/', ($t->year, $t->month, $t->day);
