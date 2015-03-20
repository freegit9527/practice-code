#!/bin/bash - 
#===============================================================================
#
#          FILE: classic_set.sh
# 
#         USAGE: ./classic_set.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 10:10
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

version=classic 
PATH=/usr/local/old_bin:/usr/bin:/bin:.
PS1="classic>"

