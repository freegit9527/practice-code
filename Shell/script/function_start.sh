#!/bin/bash - 
#===============================================================================
#
#          FILE: function_start.sh
# 
#         USAGE: ./function_start.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 2014/03/25 09:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

foo()
{
	echo "Function foo is executing"
	string="JAY";
}

echo "script is starting"
string=""
foo
echo "string = $string"
echo "script ended"

