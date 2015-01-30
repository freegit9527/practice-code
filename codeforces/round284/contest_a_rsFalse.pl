($a, $b, $c, $d) = split " ", <>;
$a *= 75 > 250 - $c ? 75 : 250 - $c;
$b *= 75 > 250 - $d ? 75 : 250 - $d;
print qw ( Tie Misha Vasya ) [$a <=> $b];
