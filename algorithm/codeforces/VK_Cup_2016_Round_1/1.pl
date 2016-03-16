#!/usr/bin/env perl 
#===============================================================================
#         FILE: 1.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 03/16/2016 11:29:06 AM
#===============================================================================

while (<>) {
    my $likes;
    my @array = split ' ', <>;
    my $max = {id => $array[0], count => 1};
    for (@array) {
        my $count = ++$likes->{$_};
        $max = {id => $_, count => $count}
          if ($count > $max->{count});
    }
    print $max->{id}, "\n";
}

exit 0;

