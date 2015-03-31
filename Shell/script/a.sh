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
#       CREATED: 03/31/2015 21:07
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
lst=`ls .`
for i in $lst
do
    if [ -f $i ]
    then 
        ls -l $i
        mv $i ./script
    fi
done

