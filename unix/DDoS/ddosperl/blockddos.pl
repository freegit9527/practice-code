#!/usr/bin/env perl 
###############################################################################
##         FILE: blockddos.pl
##       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
## ORGANIZATION: Hunan University
##      CREATED: 05/15/2015 05:44:50 PM
## DESCRIPTIONG:
## To execute, run:                                                           #
##                                                                            #
## ./ddosblock-0.2.pl                                                         #
##                                                                            #
##                                                                            #
##                                                                            #
###############################################################################


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

# ========================================
# PROGRAM BEGIN...
# ========================================


$CONFIG{TOTINCREMENTS} = $#{$CONFIG{BANINCREMENTS}};
$CONFIG{LISTFILE}      = "$CONFIG{LOGDIR}/bannedips.txt";
# init is as Sunday
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

if ($CONFIG{TESTMODE} == 1)
{
    # we are in TESTMODE and we will not change 
    # IPTABLE # we write this note to DEBUG 
    # file handle
  &debug(qq(** NOTE **\n\n
      Test mode - No IPTABLE changes will be made\n));
}

&loadbanned();

while (1)
{
  &rotatelog();

  &check(); 

  &release();

  &debug(qq(- Sleeping for $CONFIG{INTERVAL} seconds\n)) if ($CONFIG{DEBUG} > 1);

  sleep $CONFIG{INTERVAL};
}


# ========================================
# PROGRAM END... 
# ========================================

sub rotatelog
{
  my @date = localtime();
## $date[6] is the day of the week, 
## with 0 indicating Sunday and 3 
## indicating Wednesday
  my $weekday = $date[6];

  # not Sunday
  if ($weekday != $CONFIG{LASTDAY})
  {
      # not Sunday
    if ($CONFIG{LASTDAY})
    {
      close(DEBUG);
    }
    $CONFIG{LASTDAY} = $weekday;

    open(DEBUG, 
        "> $CONFIG{LOGDIR}/doslog.$weekday.txt");
  }
}


sub loadbanned
{
    # delete blocked hash table.
  undef %blocked;

  # test whether LISTFILE exists
  if (-f $CONFIG{LISTFILE})
  {
      # append LISTFILE to LIST filehandle
    open(LIST, "< $CONFIG{LISTFILE}");
    my @list = <LIST>;
    close (LIST);

    # Rebuild a list of those things we've blocked
    foreach my $ipaddress (@list)
    {
      chomp($ipaddress);

      # Let them be released and evaluated again
      $blocked{$ipaddress}{sleepuntil} = 1;
      $blocked{$ipaddress}{blocklevel} = 1;
      $blocked{$ipaddress}{lastblock}  = 1;
      $blocked{$ipaddress}{passcount}  = 0;

      &debug("- Loading blocked IP $ipaddress") 
      if ($CONFIG{DEBUG} > 0);

    }
  }
}

sub debug
{
  my ($line) = @_;

  print DEBUG localtime() . " $line \n";

  # print to standard outpu

  if ($CONFIG{STDOUT})
  {
    print localtime() . " $line \n";
  }
}


sub check
{
  my @input = `$command`;

  my $now = time;

  my $savelist;

  INPUTLOOP:
  foreach my $item (@input)
  {
    chomp($item);
    # modifier 'o' is an optimization in the case that the regex includes a 
    # variable reference. It indicates that the regex does not change 
    # even though it has a variable within it. This allows for 
    # optimizations that would not be possible otherwise.
    $item =~ s/^ +//io;
    $item =~ s/ +/ /io;

    &debug("-- $item\n") if ($CONFIG{DEBUG} >= 3);

    my ($hits, $ipaddress, $port) = split(/ /, $item);

    next INPUTLOOP if (grep(/^$ipaddress/, @{$CONFIG{EXCLUDEIPS}}));

    next INPUTLOOP if (defined $blocked{$ipaddress} && $now < $blocked{$ipaddress}{sleepuntil});

    if ($hits > $CONFIG{THRESHOLD})
    {
      $blocked{$ipaddress}{blocklevel} = $blocked{$ipaddress}{lastblock} + 1 || 1;
      $blocked{$ipaddress}{lastblock}  = $blocked{$ipaddress}{blocklevel};

      if ($blocked{$ipaddress}{blocklevel} == 1)
      {
          # -j, --jump target
          #    This  specifies  the target of the rule; i.e., what to do if the packet matches it.  
          #    The target can be a user-defined chain (other than the
          #    one this rule is in), one of the special builtin targets which decide the fate of the 
          #    packet immediately, or an extension  (see  EXTENSIONS
          #    below).  If this option is omitted in a rule (and -g is not used), then matching the 
          #    rule will have no effect on the packet's fate, but the
          #    counters on the rule will be incremented.
        my $iptcmd     = ($CONFIG{USEAPF}) ?
          "$CONFIG{APF} -d $ipaddress"
        :
        # IPT is iptables
          "$CONFIG{IPT} -I INPUT -s $ipaddress -j DROP";

        my $ok = `$iptcmd` unless ($CONFIG{TESTMODE});

        &debug("Adding block for $ipaddress ($hits hits/minute, port $port)") if ($CONFIG{DEBUG} > 0);
        &debug("- Command $iptcmd") if ($CONFIG{DEBUG} > 1);

        if ($CONFIG{MAILTO})
        {
          my $localtime = localtime();

          open (MAIL, "| $CONFIG{SENDMAIL} -t");
          print MAIL qq(To: $CONFIG{MAILTO}\nSubject: IP address $ipaddress banned\n\nBanned ip addresses $ipaddress on $localtime with $hits hits\n);
          close (MAIL);
        }
      }
      else
      {
        &debug("Setting $ipaddress to block level $blocked{$ipaddress}{blocklevel} ($hits hits/minute)") 
        if ($CONFIG{DEBUG} > 0);
      }

      &updatesleep($ipaddress);

      $savelist = 1;
    }
  }

  # Save a list of banned IPs to a file incase this process dies
  if ($savelist)
  {
    &savebanned();
  }
}

sub updatesleep
{
  my ($ipaddress) = @_;

  my $blocklevel = $blocked{$ipaddress}{blocklevel};

  $blocklevel = ($blocklevel >= $CONFIG{TOTINCREMENTS}) ?
                  $#{$CONFIG{BANINCREMENTS}} : 
                  $blocklevel;

  my $increment = $CONFIG{BANINCREMENTS}[$blocklevel - 1];

  $blocked{$ipaddress}{sleepuntil} = time + $increment;

  my $stamp = localtime(time + $increment);

  &debug("- Will check $ipaddress after $increment seconds ($stamp) - Block level $blocklevel") 
  if ($CONFIG{DEBUG} > 1);
}

sub release
{
  my $now = time;
  my $savelist;

  # Loop through all the IP addresses flagged

  foreach my $ipaddress (keys %blocked)
  {
    # No point looking at it until we've gone past the sleep date

    if ($now > $blocked{$ipaddress}{sleepuntil})
    {
      $blocked{$ipaddress}{passcount}++;

      # Remove the block on the first pass
      # then remove the 

      if ($blocked{$ipaddress}{passcount} == 1)
      {
        # Release the block

        my $iptcmd = ($CONFIG{USEAPF}) ?
          "$CONFIG{IPT} -u "
          :
          # -D, --delete chain rule-specification
          # -D, --delete chain rulenum
          # Delete  one  or  more  rules from the selected chain.  There are two versions of this command:
          # the rule can be specified as a number in the
          # chain (starting at 1 for the first rule) or a rule to match.
          "$CONFIG{IPT} -D INPUT -s $ipaddress -j DROP";

        &debug("Removing block from $ipaddress") if ($CONFIG{DEBUG}> 0);
        &debug("- Command $iptcmd") if ($CONFIG{DEBUG} > 1);

        my $ok = `$iptcmd` unless ($CONFIG{TESTMODE});

        $blocked{$ipaddress}{blocklevel} = 0;
      }
      else
      {
        &debug("- Two passes without issue $ipaddress, forgetting block level") if ($CONFIG{DEBUG} > 1);
        delete $blocked{$ipaddress};
      }

      $savelist = 1;
    }
  }

  # Save a list of banned IPs to a file incase this process dies
  if ($savelist)
  {
    &savebanned(\%blocked);
  }
}

