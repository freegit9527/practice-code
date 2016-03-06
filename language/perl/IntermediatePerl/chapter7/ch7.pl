#!/usr/bin/env perl

use 5.014;

sub hiA {
    my $person = shift;
    say "A: $person, I am A.";
}

sub hiB {
    my $person = shift;
    say "B: I guess you are $person, I am B.";
}

sub hiC {
    my $person = shift;
    if ($person eq "A") {
        say "C: Yes, you are $person. I am C.";
    } else {
        say "C: Hello $person, I am C.";
    }
    
}

my %people = (
    A => \&hiA,
    B => \&hiB,
    C => \&hiC
    );

my @everyone = sort keys %people;

for my $greeter (@everyone) {
    for my $greeted (@everyone) {
        $people{$greeter}->($greeted) unless $greeter eq $greeted;
    }
}
