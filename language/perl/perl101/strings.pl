#!/usr/bin/env perl 
#===============================================================================
#         FILE: strings.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 12/25/2015 10:03:34 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

my $name = "liuxueyang";

my $relative = "mother";

print "My name is $name, i love my $relative\n";

my $email = q{andy@foo.com};

say $email;

my $str = "abc";
say length($str);

$str = "Chicago Perl Mongers";
say substr($str, 0, 4);
say substr($str, 13);
say substr($str, -4);

my $phone = "312-588-2300";

my $exchange = substr($phone, 4, 3);
say sqrt($exchange);

my $a = q{abcde};
my $b = q{abcde};
my $c = q{abcde};

$a = $a + 1;
$b += 1;
$c++;

say join ", ", ($a, $b, $c);

my $page = <<HERE;
<html>
  <head>
    <title>
    </title>
  </head>
</html>
HERE

say $page;

my $n = 0.5;
say pack('N', "$n");

