#!/usr/bin/env perl
use 5.014;
my @rec;
for my $i (1..3) {
#    $rec[$i][$j] = $i + $j for my $j (1..4);
    for my $j (1..4) {
        $rec[$i][$j] = $i + $j;
    }
}
for my $i (1..3) {
    for my $j (1..4) {
        print "$rec[$i][$j] ";
    }
    say "";
}
