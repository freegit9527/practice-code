$\=$/;
chomp($_=<>);
($n,$m) = split ;
while ($m--) {
	chomp($_=<>);
	($a,$b,$c) = split;
	unless (exists $h{$c}) {
		$h{$c} = [$a,$b];
	}
	unless (grep {$_==$a} @{$h{$c}}) {
		push @{$h{$c}}, $a;
	}
	unless (grep {$_==$b} @{$h{$c}}) {
		push @{$h{$c}}, $b;
	}
}
chomp($q=<>);
while ($q--) {
	my $cnt=0;
	chomp($_=<>);
	my ($u,$v)=split;
	for $k (keys %h) {
		if ((grep {$_==$u} @{$h{$k}}) and (grep {$_==$v} @{$h{$k}})) {
			$cnt++;
		}
	}
	print $cnt;
}
