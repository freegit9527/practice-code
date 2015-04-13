#!/bin/bash - 
#===============================================================================
#
#          FILE: msgcheck.sh
# 
#         USAGE: ./msgcheck.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/28/2015 22:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "This scripts checks the existence of the messages file."
echo "Checking..."

if [ -f /var/log/messages ]
then
	echo "/var/log/messages exists."
fi

echo
echo "...done"

