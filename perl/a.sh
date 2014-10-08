#!/bin/bash - 
#===============================================================================
#
#          FILE: a.sh
# 
#         USAGE: ./a.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 09/12/14 08:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
FILES=`ls -1 *.pl`
for i in $FILES
do
	NAME=${i%.pl}.bak
	sed '1,3d' $i > $NAME
 	mv $NAME $i
done

