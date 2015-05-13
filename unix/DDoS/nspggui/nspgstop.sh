#!/bin/bash

if [ $# -ne 1 ]; then
	echo "usage: $0 <generator>"
	echo "ex1) $0 nspg"
	echo "ex2) $0 knspg"
	exit 1;
fi

GEN=$1
shift

case $GEN in
	nspg)
		killall $GEN
		;;
	knspg)
		knspgstop
		;;
esac

