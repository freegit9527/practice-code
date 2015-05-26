#!/usr/bin/env perl 
chomp($_=<>);
chomp($p=<>);
$_ = join'', sort split//;
$p = join'', sort split//,$p;
$p =~ s/\?+// and $q = $&;
s/()\Q$p\E// or $f++;
$pl=()=/-/g;
for $i(0..(-1+2**(length $_)))
{ ($c=()=(sprintf "%b",$i)=~/1/g)== $pl and $occ++}
print $occ / (2 ** length) * (1-$f)
