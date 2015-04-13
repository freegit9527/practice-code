#!/bin/bash - 
#===============================================================================
#
#          FILE: word2.sh
# 
#         USAGE: ./word2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 04/15/2014 20:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#read -p "word 1: " word1
# read -p "word 2: " word2 

echo -n "word 1: "
read word1

echo -n "word 2: "
read word2

if test $word1 = $word2
then 
	echo "Match"
fi

echo "end of program."

exit 0
