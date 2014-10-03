#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex12-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/14 09:27:29
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

sub listfile
{
	return "does not exists" unless -e $_[0];
	my @attribs;
	push @attribs, "readable" if -r _;
	push @attribs, "writable" if -w _;
	push @attribs, "executable" if -x _;
	return "exists" unless @attribs;
	' is ' . join " and ", @attribs;
}

sub attributes {
#	my $file = shift @_;
	my $file = $_[0];

	return "does not exist" unless -e $file;

	my @attrib;
	push @attrib, "readable" if -r _;
	push @attrib, "writable" if -w _;
	push @attrib, "executable" if -x _;
	return "exists" unless @attrib;
	'is ' . join " and ", @attrib;
}

for my $file (@ARGV) {
	my $str = &listfile($file);
	say "'$file' $str";
#	my $attribs = &attributes($file);
#	say "'$file' $attribs";
}
