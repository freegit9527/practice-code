#!/bin/bash - 
#===============================================================================
#
#          FILE: disktest.sh
# 
#         USAGE: ./disktest.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/31/2015 22:41
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

space=`df -h | awk '{print $5}' | grep % | grep -v Use |
sort -n | tail -1 | cut -d"%" -f1 -`

alertvalue="80"
if [ "$space" -ge "$alertvalue" ]
then
    echo "At least one of my disks is nearly full." |
    mail -s "daily diskcheck" root
else
    echo "Disk space normal" | mail -s "daily diskcheck" root
fi

