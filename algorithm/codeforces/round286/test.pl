$\=$/;
my %h;
unless (exists $h{1}) {
	$h{1} = [1,2];
}
unless (grep {$_ == 3} @{$h{1}}) {
	push @{$h{1}}, 3;
}
for (@{$h{1}}) {
		print "$_ ";
}
