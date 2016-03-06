#!/usr/bin/env perl

use 5.014;
use File::Find;

my %people = (
    A => sub {
        my $person = shift;
        say "A: $person, I am A.";
    },
    B => sub {
        my $person = shift;
        say "B: I guess you are $person, I am B.";
    },
    C => sub {
        my $person = shift;
        if ($person eq "A") {
            say "C: Yes, you are $person. I am C.";
        } else {
            say "C: Hello $person, I am C.";
        }
    });

my @everyone = sort keys %people;
my @room;

for my $greeter (@everyone) {
    say "$greeter gets into the room.";
    for my $roomate (@room) {
        $people{$greeter}->($roomate);
        $people{$roomate}->($greeter);
    }
    push @room, $greeter;
    say "";
}

my @start_directories = qw(.);
find(
    sub {
        say "$File::Find::name";
    },
    @start_directories);
