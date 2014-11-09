#!/usr/bin/env perl 
#===============================================================================
#         FILE: ex2-1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 11/09/2014 11:36:09
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

use Cwd;
use File::Spec;

my $path = getcwd;
opendir(DIR, $path) or die $!;
while (my $file = readdir(DIR)) {
	next if ($file =~ m/^\./);
	my $full_path = Cwd::abs_path($file);
	say "$full_path";
}
closedir(DIR);

exit 0;
