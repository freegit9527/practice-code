#!/usr/bin/env perl 
#===============================================================================
#         FILE: exercise_2.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 2016/03/14 17时02分39秒
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use File::Find;

while (<>) {
    chomp;
    my $pattern = $_;
    last if $pattern eq "";
    eval {
        find( sub { say "$File::Find::name" if (-f and 
                      $File::Find::name =~ /$pattern/);},
            '/Users/liu/Hack/',);
    };
    print "pattern error: $@" if $@;
}


