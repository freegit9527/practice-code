#!/bin/bash

if [ $# -lt 5 ]; then
	echo "usage: $0 <generator> <interface_name> <dest_mac> <template_name> <conf_file> [send options ...]"
	echo "ex1) $0 nspg eth0 001122334455 TCP tcp.txt"
	echo "ex2) $0 knspg eth1 001122334455 TCP tcp.txt -a 10"
	exit 1;
fi

GEN=$1
shift
IFNAME=$1
shift
DMAC=$1
shift
TNAME=$1
shift
CONF=$1
shift

TFILE=template/$TNAME.TXT
NOWSTR=`date +"%y%m%d_%H%M%S"`
PFILE="data/$TNAME_$NOWSTR.txt"

SWD=`echo -n "$0" | sed -e "s/.nspgsp.sh//"`;
REP_PL=`echo $0 | sed -e "s/nspgsp.sh/nspgrep.pl/g"`;
echo "$REP_PL $SWD/$CONF $SWD/$TFILE $SWD/$PFILE" >> $SWD/cmd.out
$REP_PL $SWD/$CONF $SWD/$TFILE $SWD/$PFILE

cp -f $SWD/$PFILE /tmp/foo.txt >/dev/null 2>/dev/null

echo "$GEN -d $IFNAME -v -f /tmp/foo.txt -m $DMAC -s 10 $* > /dev/null" >> $SWD/cmd.out
$GEN -d $IFNAME -v -f /tmp/foo.txt -m $DMAC -s 10 $* > /dev/null
#rm -f /tmp/foo.txt

