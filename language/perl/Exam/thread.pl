#!/usr/bin/env perl 
#===============================================================================
#         FILE: thread.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/21/2015 05:40:03
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use threads;
use Config;
#use MyMod;

$Config{useithreads} or 
die("Recompile Perl with threads to run this program.");

my $thr = threads->create(\&sub1);

my $Param3 = "foo";
my $thr1 = threads->create(\&sub1, "Param 1", "Param 2",
$Param3);
my @ParamList = (42, "Hello", 3.14);
my $thr2 = threads->create(\&sub1, @ParamList);
my $thr3 = threads->create(\&sub1, qw(Param1 Param2 Param3));

sub sub1 {
    my @InboundParameters = @_;
    print("In the thread\n");
    print("Got parameters >", join('<>', @InboundParameters),
    "<\n");
}


