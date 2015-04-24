#!/usr/bin/env perl 
#===============================================================================
#         FILE: page36.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/24/2015 03:46:57 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
sub check_item {
    my $name = shift;
    my @required = qw /
    preserver 
    sunscreen 
    water_bottle 
    jacket
    /;
    my %h_iterm = map {$_, 1} @_;
    for my $i (@required) {
        unless ($h_iterm{$i}) {
            print "$name is missing $i.\n";
        }
    }
}

check_item("skipper", qw {
    blue_shirt 
    hat 
    jacket 
    preserver 
    sunscreen
    });

my @my_item = qw {
liu-xue-yang 
yin-lin
};

my $ref_name = \@my_item;
my $ref_item = \@my_item;

sub change_name {
    my $name_lst = shift;
    @{$name_lst} = map {$_, "I_am_" . $_} @{$name_lst};
}

print "@my_item";
change_name(\@my_item);
say "";
print "@my_item";
say "";

sub delete_name {
    @{$_[0]} = grep /I_am_.*/, @{$_[0]};
}

delete_name(\@my_item);
print "@my_item\n";


sub check_required_item_ref {
    my @required = qw ( 
    preserver 
    sunscreen 
    water_bottle 
    jacket
    );
    my @missing = ();
    my %h_item = map {$_, 1} @{$_[1]};
    for my $i (@required) {
        unless ($h_item{$i}) {
            push @missing, $i;
        }
    }
    if (@missing) {
        print "Add <@missing> to <@{$_[1]}> for $_[0].\n";
        push @{$_[1]}, @missing;
    }
    print "Now, $_[0] has <@{$_[1]}>.\n";
}
my @gilligan = qw (red_shirt hat lucky_socks water_bottle);
#check_required_item_ref('Gilligan', \@gilligan);

my @professor = qw (sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ('Professor' => \@professor);

my @skipper = qw (blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ("skipper" => \@skipper);

my @gilligan_with_name = ("gilligan" => \@gilligan);

my @all_with_names = (
    \@skipper_with_name,
    \@professor_with_name,
    \@gilligan_with_name,
);

#for (@all_with_names) {
#    my $who = ${$it}[0];
#    my $item = ${$it}[1];
#    check_required_item_ref($who, $item);
#}
#check_required_item_ref();
check_required_item_ref(@$_) for (@all_with_names);
