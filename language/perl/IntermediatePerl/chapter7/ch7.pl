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

my @start_directories = qw(..);
find(
    sub {
        say "$File::Find::name";
    },
    @start_directories);

my $totalsize = 0;
{
    find(sub{$totalsize += -s if -f}, "..");
}
say $totalsize;

my $total;
{
    my $count = 0;
    $total = sub{print ++$count, ": $File::Find::name, <$_>\n" if -f};
}
find($total, "..");

my $my_total_size = 0;

sub file_call_back {
    my $count = 0;
    say "=" x 30;
    return sub {
        my $size;
        if (-f) {
            $size = -s;
            $my_total_size += $size;
            say ++$count, ": $File::Find::name <$size>";
        }
    };
}

find(file_call_back(), "..");
# find(file_call_back(), "/Users/liu/Hack");
say $my_total_size;

my $call_back = file_call_back();
find($call_back, "..");
find($call_back, "../..");
say $my_total_size;

$call_back = file_call_back();
find($call_back, "..");

my $another_call_back = file_call_back();
find($another_call_back, "..");

# how to get total_size

sub create_find_callback_that_sums_the_size {
    my $total_size = 0;
    return sub {
        if (@_) {
            return $total_size;
        } else {
                $total_size += -s if -f;
        }
    };
}

my $call_back = create_find_callback_that_sums_the_size();
find($call_back, "..");
my $size = $call_back->('dummy');
say $size;

sub create_find_call_back_that_sums_the_size {
    my $total_size = 0;
    return (
        sub{$total_size += -s if -f},
        sub{$total_size});
}

my ($call_back, $total_size) = create_find_call_back_that_sums_the_size();
find($call_back, "..");
my $size = $total_size->();
say $size;
$size = &$total_size();
say $size;
