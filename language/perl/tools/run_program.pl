#!/usr/bin/env perl 
#===============================================================================
#         FILE: run_program.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 09:43:46 AM
#      运行另外程序的程序
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $input_file;
my $current = 'current_problem.txt';

if (@ARGV > 0) {
    $input_file = $ARGV[0];
    open CURRENT, '>', $current;
    say CURRENT $ARGV[0];
    close CURRENT;
} else {
    if (-s $current and -f _) {
        open CURRENT, '<', $current;
        $input_file = readline CURRENT;
        close CURRENT;
        chomp($input_file);
    } 
    unless ($input_file) {
        open CURRENT, '>', $current;
        $input_file = 1;
        say CURRENT $input_file;
        close CURRENT;
    }
}

open STDIN, '<', $input_file;
require $input_file . '.pl';

