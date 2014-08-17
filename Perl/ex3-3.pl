#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ex3-3.pl
#
#        USAGE: ./ex3-3.pl  
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
#      CREATED: 08/16/2014 10:02:33 PM
#     REVISION: ---
#===============================================================================

#use strict;
use warnings;
use utf8;
use 5.010;

@lines = <STDIN>;
@copy_lines = @lines;
chomp(@copy_lines);
@one_line = sort @copy_lines;
@mul_line = sort @lines;
print "print in one line: @one_line\n";
print "print multiple lines:\n@mul_line\n";
chomp(@mul_line);
print "mul_line is:\n@mul_line\n";
