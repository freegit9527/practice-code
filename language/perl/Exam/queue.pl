#!/usr/bin/env perl 
#===============================================================================
#         FILE: queue.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 06:30:41
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Thread::Queue;

my $DataQueue = Thread::Queue->new();
my $thr = threads->create(sub {
        while (my $DataElement = $DataQueue->dequeue()) {
            print("Poped $DataElement off the queue\n");
        }
    });

$DataQueue->enqueue(12);
$DataQueue->enqueue("A", "B", "C");
sleep(10);
$DataQueue->enqueue(undef);
$thr->join();


