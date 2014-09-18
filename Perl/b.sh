#!/bin/bash - 
#===============================================================================
#
#          FILE: b.sh
# 
#         USAGE: ./b.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 09/12/14 09:11
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
FILES=`ls -1 *.pl`
for i in $FILES
do
	sed -e '1i\
		#!/usr/bin/perl' $i > $i.bak
	mv $i.bak $i
done

