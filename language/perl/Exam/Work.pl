#!/usr/bin/env perl 
#===============================================================================
#         FILE: Work.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/20/2015 22:30:06
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Thread::Semaphore;
use threads::shared;

my $semaphore = Thread::Semaphore->new();
my @NameList :shared;
my @ResList :shared;

#simulate calculate function.
sub cal {
    my @ran = (0, 1);
    $ran[int(rand(2))];
}

sub my_cache {
    $semaphore->down();
    my $fi = shift;
    my $line;
    chomp($line = <$fi>);
    $line =~ s/\s+/ /g;
    my ($name, $passwd, $channel) = split / /, $line;
    my $len = @NameList;
    my ($index, $pos);
    for $index (0..($len-1)) {
        if ($NameList[$index] eq $name) {
            $pos = $index;
            last;
        }
    }
    if ($pos) {
        my $truth = $ResList[$pos];
        splice @NameList, $pos, 1;
        splice @ResList, $pos, 1;
        push @NameList, $name;
        push @ResList, $truth;
        if ( $truth ) {
            print "OK";
        } else {
            print "ERR";
        }
        print " ", $channel if ($channel); 
        say;
    } else {
        my $truth = cal($name, $passwd);
        # size of cache is 10 
        if ($len == 10) {
            shift(@NameList);
            shift(@ResList);
        } else {
            push @NameList, $name;
            push @ResList, $truth;
        }
        if ( $truth ) {
            print "OK";
        } else {
            print "ERR";
        }
        print " ", $channel if ($channel);
        print "\n";
    }
    $semaphore->up();
}

my $TXT;
open $TXT, 'in.txt';


my $thr1 = threads->new(\&my_cache, $TXT);
my $thr2 = threads->new(\&my_cache, $TXT);

$thr1->join();
$thr2->join();

# in.txt
# liuxueyang 1234 1
# lxy 321
#
