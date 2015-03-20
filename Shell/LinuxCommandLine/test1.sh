#!/bin/bash - 
#===============================================================================
#
#          FILE: test1.sh
# 
#         USAGE: ./test1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 07/31/2014 06:51
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo -n The time and date are:
date
echo "Let's see who's logged into the system: "
who

exit 0
