$\=$/;
$s = <>;
chomp($s);
$len = length($s);
for $i ('a'...'z') {
	for $len1 (0...$len) {
		$k = substr($s,0,$len1) . $i . substr($s,$len1,$len-$len1);
		if ( $k eq reverse $k ) {
			print $k;
			exit;
		}
	}
}
print "NA";
