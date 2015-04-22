#!/usr/bin/env perl 
#===============================================================================
#         FILE: threadperl.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/22/2015 11:22:38 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Thread::Queue;

my $threadAllowed = 2;
my @threads;

for (1..10) {
    push @threads, threads->create(\&processThread, $_);
    sleep(3) while (scalar threads->list(threads::running) >=
    $threadAllowed);
}

$_->join() for (threads->list());

sub processThread {
    my $number = shift;
    my $tid = threads->tid();
    print "Thread $tid is printing the number $number\n";
    sleep(1);
}


