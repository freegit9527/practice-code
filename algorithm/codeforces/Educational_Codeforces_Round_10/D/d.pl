use strict;
use 5.014;
use utf8;

my $n;
chomp($n = <>);
my @s;

for(0..$n-1) {
    my $segment;
    chomp($segment = <>);
    my ($l, $r) = split(' ', $segment);
    push @s, {
        left => $l,
        right => $r,
        position => $_,
    };
}

# compress right
@s = sort { $a->{right} <=> $b->{right} } @s;

for(0..$#s) {
    $s[$_]->{right} = $_ + 1;
}

# sort by left
@s = sort { $b->{left} <=> $a->{left} } @s;

my @ans;
my @fenwick = ();

for(@s) {
    $ans[$_->{position}] = presum($_->{right});
    updateFenwick($_->{right});
}

for(@ans) { say $_ }

sub presum {
    my $index = shift;
    my $ans = 0;
    while ($index > 0) {
        $ans += $fenwick[$index];
        $index -= lowbit($index);
    }
    $ans;
}

sub updateFenwick {
    my $index = shift;
    while ($index <= $n) {
        $fenwick[$index]++;
        $index += lowbit($index);
    }
}

sub lowbit { $_[0] & -$_[0] }
