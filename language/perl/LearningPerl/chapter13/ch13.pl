#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch13.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 2016/03/14 18时35分35秒
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $dir = '.';
chdir "$dir" or die "cannot not chdir to $dir: $!";

my @all_files = glob '*.pl'; # glob 并不会递归查找文件
print join "\n", @all_files, "\n";
