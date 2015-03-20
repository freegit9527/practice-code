#!/bin/bash - 
#===============================================================================
#
#          FILE: fileexist.sh
# 
#         USAGE: ./fileexist.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/27/2014 15:39
#      REVISION: 0.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error
read -p "enter a file name: " filename
if [ -e $filename ]; then 
	if [ -f $filename ]; then
		echo "Filename is regular file"
	elif [ -d $filename ]; then 
		echo "Filename is directory"
	fi
	if [ -r $filename ]; then 
		echo "This file can be read"
	fi
	if [ -w $filename ]; then 
		echo "This file can be wrote"
	fi
	if [ -x $filename ]; then 
		echo "This file can be excute"
	fi
else
	echo "Filename does not exist"
	exit 1
fi

exit 0
