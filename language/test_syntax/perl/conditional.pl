#!perl -n

chomp;

my $n = $_ + 0;
my $m = 100;
print $n ? $n : $m, "\n";
print $n || $m, "\n";
#print 
#my $m = 000;
#print $m ? 233 : 466, "\n";
