#!/usr/bin/perl
#===============================================================================
#         FILE: ch9.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 09/11/14 08:10:54
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

my $original = "Fred ate 1 rib";
my $copy = $original =~ s/\d+ ribs?/10 ribs/r;
say "original = $original";
say "copy = $copy";

$_ = "I saw Barney with Fred.";
s/(fred|barney)/\U$1/gi;
say "\$_ = $_";
s/(fred|barney)/\L$1/gi;
say "\$_ = $_";
s/(\w+) with/\U$1\E with/i;
say "\$_ = $_";
s/(\w+) with/\U$1 with/i;
say "\$_ = $_";

my @fields = split /:/, "abc:def:g:h";
say "fields = @fields";

my $x = join ":", 4, 6, 8, 10, 12;
say "x = $x";
my @values = split /:/, $x;
my $z = join "-", @values;
say "\$z = $z";

my $text = "Fred dropped a 5 ton granite block on Mr. Slate";
my @words = ($text =~ /([a-z]+)/ig);
say "Result: @words";

my $data = "Barney Rubble Fred Flintstone Wilma Flintstone";
my %last_name = ($data =~ /(\w+)\s+(\w+)/g);
foreach my $last (keys %last_name) {
	say "$last => $last_name{$last}";
}

my $sen = "I thought you said Fred and <BOLD>Velma</BOLD>, not <BOLD>Wilma</BOLD>";
$sen =~ s#<BOLD>(.*?)</BOLD>#$1#g;
say "\$sen = $sen";

$_ = "I'm much better\nthan Barney is\nat bowling,\nWilma.\n";
say "Found 'wilma' at start of line\n" if /^wilma\b/im;

if (! open HEY, '<', 'nonexistingfile') {
	die "Cannot create the file: $!";
}
