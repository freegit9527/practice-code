#!/usr/bin/env perl 
#===============================================================================
#         FILE: hashFunction.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 19:48:01
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my %my_hash = qw (
  bird alba
  fish shark
  insect spider
  animal dog
);

if (exists($my_hash{animal})) {
    say "Key does exists.";
}
else {
    say "Key does not exists.";
}

if (defined($my_hash{animal})) {
    say "Key defined.";
}
else {
    say "Key does not defined.";
}

delete($my_hash{fish});
if (exists($my_hash{fish})) {
    say "Key does exists.";
}
else {
    say "Key does not exists.";
}

my @pets = @my_hash{qw / bird animal / };
$\ = $/;
print "@pets";
