#!/usr/bin/env perl 
#===============================================================================
#         FILE: backquote.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 05:50:46 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my @functions = qw / int rand sleep length 
hex eof not exit sqrt umask /;
my %about;
for (@functions) {
    $about{$_} = `perldoc -t -f $_`;
}

for (keys %about) {
    print $about{$_};
}

