#!/bin/bash - 
#===============================================================================
#
#          FILE: runprogram.sh
# 
#         USAGE: ./runprogram.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/01/2014 08:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
if [ $# -eq 1 ]
then 
	temp=`mktemp -t temp.XXXXXX`
	./$1 >$temp 
# 	kdialog --textbox $temp 500 500
	dialog --textbox $temp 500 500
else 
	echo "Used: runprogram.sh filename"
	exit 1
fi

exit 0

