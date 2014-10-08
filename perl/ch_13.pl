#!/usr/bin/env perl 
#===============================================================================
#         FILE: ch_13.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 10/03/2014 04:33:54 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use autodie;

#my @all_files = glob '*';
#my @pl_files = glob '*.pl';
#say "This is all of my files in the current directory:\n@all_files";
#say "This is all of my perl files in the current directory:\n@pl_files";

#my $dirname;
#$dirname = $ARGV[0];
#chdir $dirname or die "Cannot enter $dirname: $!";
#for (glob '*.old') {
#	my $file = $_ =~ s/\.old$/.new/r;
#	if (-e $file) {
#		warn "Cannot rename $_: $_ exists";
#	}
#	elsif (rename $_ => $file) {
#	}
#	else {
#		warn "rename $_ to $file failed: $!";
#	}
#}
#while (my $name = readdir $somedir) {
#	next if $name =~ /^\./;
#	$name = "$dirname/$name";
#	next unless -f -w $name;
#	say "$name is readable and writeable";
#	say "I will delete it...";
#	unlink $name or warn "failed deletion on $name: $!\n";
#}
#

#my ($name, $perm) = @ARGV;
#mkdir $name, oct($perm) or die "Cannot create $name: $!";

my $name = $ARGV[0];
chmod 0755, $name;
rmdir $name;
