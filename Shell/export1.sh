#!/bin/bash - 
#===============================================================================
#
#          FILE: export1.sh
# 
#         USAGE: ./export1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 10:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

foo="The first meta-syntactic variable"
export bar="The second meta-syntactic variable"

./export2.sh

