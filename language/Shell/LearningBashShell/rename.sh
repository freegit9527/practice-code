#!/bin/bash - 
#===============================================================================
#
#          FILE: rename.sh
# 
#         USAGE: ./rename.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 08/02/2014 14:20
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

dir=$1
list=`ls $dir`
count=0
for eachfile in $list 
do
	outfile=${eachfile%0.c}$count.cpp
	mv $dir/$eachfile $dir/$outfile
	count=$[$count+1]
done

exit 0

