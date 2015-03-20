#!/bin/bash - 
#===============================================================================
#
#          FILE: parameter_get.sh
# 
#         USAGE: ./parameter_get.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/25/14 14:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
unset foo 
echo ${foo:-bar}

foo=fud 
echo ${foo:-bar}

foo=/usr/bin/X11/startx
echo ${foo#*/}
echo ${foo##*/}

bar=/usr/local/etc/local/networks
echo ${bar%local*}
echo ${bar%%local*}

exit 0

