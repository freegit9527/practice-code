#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ex1.pl
#
#        USAGE: ./ex1.pl  
#
#  DESCRIPTION: no
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 08/15/2014 03:44:19 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.010;

#say "Hello ";
#say "World!";
#print "Hello ";
#print "World!\n";

print "Input two numbers\n";
my $a = <STDIN>;
chomp $a;
chomp($b = <STDIN>);
my $sum = $a + $b;
print "The sum is $sum\n";
