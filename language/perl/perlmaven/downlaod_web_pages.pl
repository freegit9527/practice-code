#!/usr/bin/env perl 
#===============================================================================
#         FILE: downlaod_web_pages.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 04/15/2015 11:45:32 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $url = 'liuxueyang.github.io';
#system "wget $url";

$url = "http://liuxueyang.blog.com";
my $html = qx{wget --quiet --output-document=- $url};
print $html;


