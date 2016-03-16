#!/usr/bin/env perl 
#===============================================================================
#         FILE: showtime.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 09:41:30 AM
#      试验一个perl程序调用另外一个perl程序
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

#require "gettime.pl";

say "gettime ok~";
my $file = "gettime.pl";
require $file;

