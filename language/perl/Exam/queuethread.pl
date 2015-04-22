#!/usr/bin/env perl 
#===============================================================================
#         FILE: queuethread.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/22/2015 11:06:47 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Thread::Queue;

my $q = new Thread::Queue;
$q->enqueue($_) for 1..10;

$q->enqueue(undef);
$q->enqueue(undef);


my $t1 = threads->new(\&tsub);
my $t1id = $t1->tid();
print "\$t1id = $t1id\n";

my $t2 = threads->new(\&tsub);
my $t2id = $t2->tid();
print "\$t2id = $t2id\n";

$_->join for threads->list();

sub tsub {
    my $tid = threads->tid();
    while (my $x = $q->dequeue) {
        print "\$x = $x\n";
    }
    print "thread $tid ended...\n";
}
