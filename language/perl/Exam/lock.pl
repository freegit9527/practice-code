#!/usr/bin/env perl 
#===============================================================================
#         FILE: lock.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 06:16:10
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use threads::shared;

my $total :shared = 0;
sub calc {
    while (1) {
        my $result;
        $result = 1;
        {
            lock($total);
            $total += $result;
            $result--;
        }
        last if $result == 0;
    }
}

my $thr1 = threads->create(\&calc);
my $thr2 = threads->create(\&calc);
my $thr3 = threads->create(\&calc);

$thr1->join();
$thr2->join();
$thr3->join();
print("total = $total\n");
