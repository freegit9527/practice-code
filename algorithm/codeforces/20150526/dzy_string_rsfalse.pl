#!/usr/bin/env perl 
@ARGV = qw/dzy_string.txt/;
while(<>){
	
	chomp;
	$n=<>;
	@az=split/ /,<>;
	
	@Az = sort {$b<=>$a} @az;
#	print $Az[0];
	
	s/./ $&/g;
	tr/a-j/0-9/;
	s/[k-t]/1$&/g;
	s/[u-z]/2$&/g;
	tr/k-t/0-9/;
	tr/u-z/0-5/;
	s/ //;
	
#	print "=$_=";
	
	@a=/\d+/g;
	$j=0;
	$sum=0;
	
#	print "?@a?";
	for $i(@a){
		
		$j++;
		$sum += @az[$i] * $j;
		
#		print "$sum\n";
		}
		
	for $i(1..$n){
		$j++;
		$sum += @Az[0] * $j;
		
		}
#	print 'z'-'a';
	print "$sum\n";
	}
