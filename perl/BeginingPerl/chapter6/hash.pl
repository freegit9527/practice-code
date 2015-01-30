use strict;
use warnings;

my %words = (
	dog => 'chien',
	eat => 'manger',
	clown => 'clown',
);
my $english_to_french = \%words;
for my $english (keys %$english_to_french) {
	print "The french word for '$english' is '$english_to_french->{$english}'\n";
}


