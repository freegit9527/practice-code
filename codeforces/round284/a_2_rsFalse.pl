($n, $x) = split " ", <>;
$/ = $,;
$_ = "0\n".<>;
$s += $2 - $1 + 1 while /(\d+) (\d+)/g;
$s += ($2 - $1 - 1) % $x while /(\d+)\n(\d+)/g;
print $s
