#!/usr/bin/env perl 
#===============================================================================
#         FILE: threadpool.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/23/2015 10:33:15 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Thread::Pool; # must install Thread::Pool module using cpan tool.

my $pool = Thread::Pool->new(
    {
        workers => 3,
        do => \&do,
        monitor => \&monitor,
    }
);

open TXT, "input.txt";
#$pool->job($_) while <TXT>;
while (defined(my $line = <TXT>)) {
    chomp($line);
    my @tokens = split / /, $line;
    $pool->job(@tokens);
}

$pool->shutdown();

sub do {
    print "name: $_[0]\tpasswd: $_[1]\t";
    print "channel: $_[2] " if (defined($_[2]));
    print "\n";
    sleep(5);
}

sub monitor {
#    print $_[0];
}
