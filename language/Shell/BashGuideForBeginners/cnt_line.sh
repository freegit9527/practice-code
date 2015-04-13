#!/bin/bash - 
#===============================================================================
#
#          FILE: cnt_line.sh
# 
#         USAGE: ./cnt_line.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/31/2015 21:10
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error
lst=`ls ../LearningBashShell/examples/`
for i in $lst
do
#     num=`wc -l ../LearningBashShell/examples/$i`
# I have a question
    num=20
    if [ "$num" -gt "150" ]
    then
        echo;
        echo "$i is more than 150 lines..."
    fi

done

