#!/bin/bash - 
#===============================================================================
#
#          FILE: latest_set.sh
# 
#         USAGE: ./latest_set.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 10:11
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

version=latest 
PATH=/usr/local/new_bin:/usr/bin:/bin:.
PS1=" latest version> "

