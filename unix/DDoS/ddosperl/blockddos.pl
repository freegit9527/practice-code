#!/usr/bin/env perl 
#===============================================================================
#         FILE: blockddos.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/15/2015 05:44:50 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;

use vars qw(%CONFIG %blocked);

$| = 1;

my %CONFIG = (

  ## 0 = No output
  ## 1 = Actions reported
  ## 2 = Actions + unix commands reported
  ## 3 = Verbose in the extreme

  DEBUG => 2,

  ## Do we perform checks only - no IPTABLE changes - 
  ## Good for debugging

  TESTMODE => 0,

  ## Ban IP addresses above this number of accesses

  THRESHOLD => 150,

  ## How long, in seconds, between checks

  INTERVAL => 30,

  ## If we have APF use that, otherwise fallback on iptables

  USEAPF => 0,

  ## How long (in seconds) do we ban people for
  ## escalating each time they're bad
  ## This resets to the first item, when they have gone
  ## a full interval without being flagged
  ##
  ## 60, 300, 3600 would mean that they are banned for 
  ## 60 seconds, then 5 minutes, then an hour
  ## 
  ## This list can have as many increment levels as you like

  BANINCREMENTS => [60, 120, 240, 800, 1200],

  ## IP ADDRESSES THAT WE WILL NEVER BAN

  EXCLUDEIPS => [ "127.0.0.1", "10.0.0.1" ],

  ## UNIX COMMANDS 

  NETSTAT => "/bin/netstat",

  IPT => "/usr/sbin/iptables",

  APF => "/usr/local/sbin/apf",

  SENDMAIL => "/usr/sbin/sendmail",

  ## WHERE TO STORE/SAVE OUTPUT

#  LOGDIR => "/var/log/ddosblock",
  LOGDIR => "./log",

  MAILTO => "nobody\@example.com", # NOTE: Under Perl 
  ## you have to escape the @ symbol with a slash

  STDOUT => 1, # In addition to logging, do 
  ## we want to report it to STDOUT

);


$CONFIG{TOTINCREMENTS} = $#{$CONFIG{BANINCREMENTS}};
$CONFIG{LISTFILE}      = "$CONFIG{LOGDIR}/bannedips.txt";
$CONFIG{LASTDAY}       = 0;

if ( ! -d $CONFIG{LOGDIR})
{
  print "Creating log directory $CONFIG{LOGDIR}\n\n";
  mkdir $CONFIG{LOGDIR},700;
}

my $command = qq($CONFIG{NETSTAT} -ntu |
                awk '{ sub(/(.*)\:/,"",\$4); 
                sub(/\:(.*)/,"",\$5); print \$5,\$4}' |
                grep ^[0-9] |
                sort |
                uniq -c |
                sort -nr |
                head -30 );

&rotatelog();

sub rotatelog
{
  my @date = localtime();
  my $weekday = $date[6];

  if ($weekday != $CONFIG{LASTDAY})
  {
    if ($CONFIG{LASTDAY})
    {
      close(DEBUG);
    }
    $CONFIG{LASTDAY} = $weekday;

    open(DEBUG, "> $CONFIG{LOGDIR}/doslog.$weekday.txt");
  }
}
