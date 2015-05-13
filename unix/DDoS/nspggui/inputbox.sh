#!/bin/sh
# $Id: inputbox,v 1.6 2003/08/15 19:40:37 tom Exp $
: ${DIALOG=dialog}

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --title "$1" --nocancel \
        --inputbox "$2" 20 80 2> $tempfile

retval=$?

case $retval in
  0)
    #echo "Input string is `cat $tempfile`"
    cat $tempfile
	mv $tempfile /tmp/inputbox.out
	;;
  1)
    #echo "Cancel pressed."
	;;
  255)
    if test -s $tempfile ; then
      cat $tempfile
    #else
      #echo "ESC pressed."
    fi
    ;;
esac
