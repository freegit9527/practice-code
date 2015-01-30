$\ = $/;
($n, $x) = split " ", <>;
$/ = $,;
$_ = <>;
$sum += $2 - $1 + 1 while /(\d+) (\d+)/g;
s/^/0\n/;
$sum += ($2 - $1 - 1) % $x while / (\d+) \n (\d+) /gx;
print $sum
