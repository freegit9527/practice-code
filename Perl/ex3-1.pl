#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: ex3-1.pl
#
#        USAGE: ./ex3-1.pl  
#
#  DESCRIPTION: none
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 08/16/2014 09:53:30 PM
#     REVISION: ---
#===============================================================================

#use strict;
use warnings;
use utf8;
use 5.010;

chomp(@lines = <STDIN>);
@new_lines = reverse @lines;
say "@new_lines";


