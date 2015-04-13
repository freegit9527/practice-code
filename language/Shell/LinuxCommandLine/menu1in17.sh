#!/bin/bash - 
#===============================================================================
#
#          FILE: menu1in17.sh
# 
#         USAGE: ./menu1in17.sh 
# 
#   DESCRIPTION: simple script menu
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 07/31/2014 16:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function diskspace
{
	clear
	df -k
}

function whoseon
{
	clear
	who
}

function memusage
{
	clear
	cat /proc/meminfo
}

function menu 
{
	clear 
	echo 
	echo -e "\t\t\tSys Admin Menu\n"
	echo -e "\t1. Display disk space\n"
	echo -e "\t2. Display logged on users\n"
	echo -e "\t3. Display memory usage\n"
	echo -e "\t0. Exit program\n\n"
	echo -en "\t\t Enter option: "
	read -n 1 option
}

while [ 1 ]
do 
	menu 
	case $option in 
		0)
			break 
			;;
		1)
			diskspace 
			;;
		2)
			whoseon 
			;;
		3)
			memusage 
			;;
		*)
			clear 
			echo "Sorry, wrong selection"
			;;
	esac 
	echo -en "\n\n\t\t\t Hit any key to continue"
	read -n 1 line
done 
clear

exit 0

