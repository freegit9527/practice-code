#!/usr/bin/env perl 
#===============================================================================
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/26/2015 15:04:25
#===============================================================================


#@ARGV = qw/in.txt/;
while(<>)
{
    chomp;
    my $origin = $_;
    chomp(my $rece = <>);
    my $pos_origin = $origin =~ tr/+//;
    my $neg_origin = $origin =~ tr/-//;
    my $pos_rece = $rece =~ tr/+//;
    my $neg_rece = $rece =~ tr/-//;
    my $que_rece = $rece =~ tr/?//;
    my $goal = $pos_origin - $neg_origin;
    my $now = $pos_rece - $neg_rece;
    my $gap = abs($goal - $now);
    my $even = $que_rece - $gap;
    if ($origin eq $rece) {
            printf("%1.16f\n", 1);
    }
    elsif ($even >= 0 && $even % 2 == 0) {
        if ($even == 0) {
            printf("%1.16f\n", (1/2)**$gap);
        } else {
            my $m = $even / 2;
            my $n = $que_rece - $m;
            my $res = fac($que_rece) / fac($m) / fac($n) * ((1/2) ** $m) *
                    ((1/2) ** $n);
            printf("%1.16f\n", $res);
        }
    } else {
        printf("%1.16f\n", 0);
    }
}

sub fac
{
    my $res = 1;
    my $n = shift;
    $res *= $n-- while $n;
    $res;
}
