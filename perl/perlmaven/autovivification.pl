#!/usr/bin/env perl 
#===============================================================================
#         FILE: autovivification.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 01/23/2015 07:36:07 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

use Data::Dumper qw(Dumper);

$\ = $/;

my %phone_of;

####################

print Dumper \%phone_of;
$phone_of{foo} = '123-456';
print Dumper \%phone_of;

####################

my $phone_of;
print Dumper $phone_of;
$phone_of->{foo} = '000-456';
print Dumper $phone_of;

####################

my %counter;
print Dumper \%counter;
$counter{Foo}++;
print Dumper \%counter;


####################
#

my @counter;
print Dumper \@counter;
$counter[1] = 20;
$counter[3]++;
print Dumper \@counter;


####################

my %people;
print Dumper \%people;
$people{foo}{john} = '123-45678-90';
print Dumper \%people;

####################

my $people;
print Dumper $people;
$people->{foo}{john} = '321-654';
print Dumper $people;
