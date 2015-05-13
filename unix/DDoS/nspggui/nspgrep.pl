#!/usr/bin/perl

if ( $#ARGV != 2) {
  printf STDERR "usage: <conf_file> <template_file> <packet_file>\n";
  exit 1;
}

my($CONF) = $ARGV[0];
my($TFILE) = $ARGV[1];
my($PFILE) = $ARGV[2];

open(CIF, "<$CONF") || die "Can't open conf file $CONF: $!\n";
open(TIF, "<$TFILE") || die "Can't open template file $TFILE: $!\n";
open(POF, ">$PFILE") || die "Can't write packet file $PFILE: $!\n";

my($line);
my(@vars);
my(@vals);
my($cnt) = 0;
my(@eles);
while(<CIF>) {
	$line = $_;
	$line =~ s/#.*$//g;
	$line =~ s/\s*$//g;
	$line =~ s/\n//g;
	next if (length($line) le 0);
	
	@eles = split(/=/, $line);
	next if ($#eles ne 1);

	$vars[$cnt] = $eles[0];
	$vals[$cnt] = $eles[1];

#	printf "[%02d] <%s>=<%s>\n", $cnt, $vars[$cnt], $vals[$cnt];
	++$cnt;
}
close(CIF);


my($i);
my($v);
my($r);
while(<TIF>) {
	$line = $_;
	$line =~ s/#.*$//g;
	$line =~ s/\s*$//g;
	$line =~ s/\n//g;
	next if (length($line) le 0);

	for ($i = 0; $i <= $#vars; ++$i) {
		$v=$vars[$i];
		$r=$vals[$i];
		if (index($line, $v) ge 0) {
			$line =~ s/${v}/${r}/g;
		}
	}
	printf POF "%s\n", $line;
}
close TIF;
close POF;

exit 0;
