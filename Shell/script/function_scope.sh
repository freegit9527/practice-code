#!/bin/bash - 
#===============================================================================
#
#          FILE: function_scope.sh
# 
#         USAGE: ./function_scope.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 09:30
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sample_text="global variable"
foo()
{
	local sample_text="local variable"
	echo "Function foo is executing"
	echo $sample_text
}

echo "script starting"
echo $sample_text

foo
echo "script ended"
echo $sample_text

exit 0

