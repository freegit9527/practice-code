#!/bin/sh

if [ $# -lt 2 -o $# -gt 3 ];then
	echo "usage: $0 <variable_name> <value> <*{txt}*.txt>"
	echo "ex1) $0 DURATION 60 _sf"
	echo "ex2) $0 DIP \"AA BB CC DD\" \"\""
	exit 1;
fi

SWD=`echo -n "$0" | sed -e "s/.change.sh//"`;

VAR=$1
VAL=$2
if [ $# -eq 3 ];then
	FILTER=$3
fi

for cf in `ls $SWD/*$FILTER*.txt`;do
	cat $cf | sed -e "s/^@@$VAR=.*/@@$VAR=$VAL/" > $cf.tmp
	mv -f $cf.tmp $cf
done

