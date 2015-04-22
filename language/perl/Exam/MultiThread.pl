#!/usr/bin/env perl 
#===============================================================================
#         FILE: MultiThread.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/22/2015 11:53:16 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use threads::shared;

open TXT, "input.txt";
my ($first, $second, @record1, @record2, @threads);
my @NameList :shared;
my @ResList :shared;

sub cal { int(rand(2)); }

while (defined($first = <TXT>)) {
    chomp($first);
    $first =~ s/\s+/ /g;
    @record1 = split / /, $first;
    threads->create(\&myfunc, @record1);
    if (eof(TXT)) {
        # process only one
        print "<$_> " for @record1;
        print "\n";
        $_->join() for (threads->list());
        print "\nCurrent Array contains: ";
        print "<$_> " for @NameList;
        print "\n";
        print "=" x 20 . "A while ended...." . "=" x 20 . "\n\n";
        last;
    }
    print "<$_> " for @record1;
    print "\n";
    chomp($second = <TXT>);
    $second =~ s/\s+/ /g;
    @record2 = split / /, $second;
    threads->create(\&myfunc, @record2);
    print "<$_> " for @record2;
    print "\n";
    $_->join() for (threads->list());
    print "\nCurrent Array contains: ";
    print "<$_> " for @NameList;
    print "\n";
    print "=" x 20 . "A while ended...." . "=" x 20 . "\n\n";
}

sub myfunc {
    my $token = @_;
    my ($name, $passwd, $channel) = @_;
    my ($index, $pos, $truth, $len);

    # a block lock NameList
    {
        lock(@NameList);
        $len = @NameList;
        for $index (0..($len - 1)) {
            if ($NameList[$index] eq $name) {
                $pos = $index;
                last;
            }
        }
        # unlocking happens when this block ends.
    }

    if ($pos) {
        lock(@NameList);
        lock(@ResList);
        $truth = $ResList[$pos];
        # delete name 
        delete $NameList[$pos];
        delete $ResList[$pos];
#        splice @NameList, $pos, 1;
#        splice @ResList, $pos, 1;
        # add it at the end of array
        @NameList = grep defined, @NameList;
        @ResList = grep defined, @ResList;
        push @NameList, $name;
        push @ResList, $truth;
        if ($truth) {
            print "OK";
        } else {
            print "ERR";
        }
        print " ", $channel if (defined($channel));
        print "\n";
        # unlock at end of block
    } 
    else {
        lock(@NameList);
        lock(@ResList);
        $truth = cal($name, $passwd);
        if ($len == 10) {
            shift(@NameList);
            shift(@ResList);
        } else { push @NameList, $name;;
            push @ResList, $truth;
        }
        if ($truth) {
            print "OK";
        } else {
            print "ERR";
        }
        print " ", $channel if (defined($channel));
        print "\n";
    }


    my $tid = threads->tid();
    print "token = $token. Thread $tid ended. Please wait for 5 seconds...\n\n";
    sleep(5);
}


=commet
Program output:
aries@raymond:~/Hack/language/perl/Exam> perl MultiThread.pl 
<liuxueyang> <1234> <0> 
ERR 0
token = 3. Thread 1 ended. Please wait for 5 seconds...

<lxy> <321> 
ERR
token = 2. Thread 2 ended. Please wait for 5 seconds...


Current Array contains: <liuxueyang> <lxy> 
====================A while ended....====================

<phoenix> <12> <2> 
ERR 2
token = 3. Thread 3 ended. Please wait for 5 seconds...

<mu> <21> 
OK
token = 2. Thread 4 ended. Please wait for 5 seconds...


Current Array contains: <liuxueyang> <lxy> <phoenix> <mu> 
====================A while ended....====================

<ray> <9> <98> 
OK 98
token = 3. Thread 5 ended. Please wait for 5 seconds...

<phoenix> <12> <2> 
ERR 2
token = 3. Thread 6 ended. Please wait for 5 seconds...


Current Array contains: <liuxueyang> <lxy> <mu> <ray> <phoenix> 
====================A while ended....====================

<lxy> <321> 
ERR
token = 2. Thread 7 ended. Please wait for 5 seconds...


Current Array contains: <liuxueyang> <mu> <ray> <phoenix> <lxy> 
====================A while ended....====================

=cut

=comment
liuxueyang 1234 0
lxy 321
phoenix 12 2
mu 21
ray 9 98
phoenix 12 2
lxy 321
=cut
