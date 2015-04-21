#!/usr/bin/env perl 
#===============================================================================
#         FILE: prime.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 08:59:50 AM
#===============================================================================

use strict;
use warnings;
use utf8;
# prime-pthread, courtesy of Tom Christiansen
use threads;
use Thread::Queue;

sub check_num {
    my ($upstream, $cur_prime) = @_;
    my $kid;
    my $downstream = Thread::Queue->new();
    while (my $num = $upstream->dequeue()) {
        next unless ($num % $cur_prime);
        if ($kid) {
            $downstream->enqueue($num);
        } else {
            print("Found prime: $num\n");
            $kid = threads->create(\&check_num, $downstream, $num);
            if (! $kid) {
                warn("Sorry.  Ran out of threads.\n");
                last;
            }
        }
    }
    if ($kid) {
        $downstream->enqueue(undef);
        $kid->join();
    }
}

my $stream = Thread::Queue->new(2..100, undef);
check_num($stream, 2);


