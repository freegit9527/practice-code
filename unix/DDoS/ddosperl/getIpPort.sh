#!/bin/bash - 
#===============================================================================
#
#          FILE: command.sh
# 
#         USAGE: ./command.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 05/15/2015 10:59
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
netstat -ntu | 
awk '{ sub(/(.*)\:/, "", $4);
      sub(/\:(.*)/, "", $5);
      print $5, $4}' |
grep ^[0-9] |
sort |
uniq -c |
sort -nr |
head -30

