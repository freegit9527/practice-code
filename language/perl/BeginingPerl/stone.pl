$_ = "VErY well";
if ($_ =~ /(?i)very(?-i)/)
{
	print "match very\n";
}
