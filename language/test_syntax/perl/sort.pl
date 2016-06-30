#!perl

use 5.014; 
use Data::Dumper qw(Dumper);

my @numbers = (14, 3, 12, 2, 23);

 @numbers = sort { $b <=> $a } @numbers;

say Dumper \@numbers;
