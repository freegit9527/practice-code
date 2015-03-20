#!/bin/bash - 
#===============================================================================
#
#          FILE: menu3in17.sh
# 
#         USAGE: ./menu3in17.sh 
# 
#   DESCRIPTION: using dialog to create a menu
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 07/31/2014 16:39
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

temp=`mktemp -t test.XXXXXX`
temp2=`mktemp -t test2.XXXXXX`
function diskspace
{
	df -k > $temp 
	dialog --textbox $temp 20 60
}

function whoseon
{
	who > $temp 
	dialog --textbox $temp 20 50
}

function memusage 
{
	cat /proc/meminfo > $temp 
	dialog --textbox $temp 20 50
}

while [ 1 ]
do
	dialog --menu "Sys Admin Menu" 20 30 10 \
	1 "Display disk space" 2 "Display users" \
	3 "Display memory usage" 0 "exit" \
	2> $temp2
	if [ $? -eq 1 ]
	then 
		break 
	fi 
	selection=`cat $temp2`
	case $selection in 
		1)
			diskspace 
			;;
		2)
			whoseon
			;;
		3)
			memusage
			;;
		0)
			break
			;;
		*)
			dialog --msgbox "Sorry, invalid selection" 10 30
			;;
	esac 
done

rm -f $temp 2> /dev/null 
rm -f $temp2 2> /dev/null

exit 0

