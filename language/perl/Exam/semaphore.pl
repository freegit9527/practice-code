#!/usr/bin/env perl 
#===============================================================================
#         FILE: semaphore.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 06:34:44
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Thread::Semaphore;

my $semaphore = Thread::Semaphore->new();
my $GlobalVariable :shared = 0;

my $thr1 = threads->create(\&sample_sub, 1);
my $thr2 = threads->create(\&sample_sub, 2);
my $thr3 = threads->create(\&sample_sub, 3);

sub sample_sub {
    my $SubNumber = shift(@_);
    my $TryCount = 10;
    my $LocalCopy;
    sleep(1);
    while ($TryCount--) {
        $semaphore->down();
        $LocalCopy = $GlobalVariable;
        print("$TryCount tries left for sub $SubNumber" . "(\&GlobalVariable is $GlobalVariable)\n");
        sleep(2);
        $LocalCopy++;
        $GlobalVariable = $LocalCopy;
        $semaphore->up();
    }
}

$thr1->join();
$thr2->join();
$thr3->join();
