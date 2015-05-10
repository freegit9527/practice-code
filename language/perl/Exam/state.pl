#!/usr/bin/env perl 
#===============================================================================
#         FILE: state.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/09/2015 08:04:10 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

sub marine 
{
    state $n = 0;
    $n += 1;
    print "Hello, sailor number $n!\n";
}

sub three_call {
    &marine;
    &marine;
    &marine;
}

&three_call;
