#!/usr/bin/env perl 
#===============================================================================
#         FILE: join.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 05:51:34
#===============================================================================

use strict;
use warnings;
use utf8;
use threads;

my ($thr) = threads->create(\&sub1);
my @ReturnData = $thr->join();
print("Thread returned ", join(", ", @ReturnData), "\n");

sub sub1 {
    return ("Fifty-six", "foo", 2);
}

my $thr1 = threads->new(\&thrsub, "test1");
my $thr2 = threads->new(\&thrsub, "test2");

sub thrsub {
    my ($message) = @_;
    sleep 1;
    print "thread $message\n";
}

$thr1->join();
$thr2->join();
