#!/bin/bash - 
#===============================================================================
#
#          FILE: check_noclobber.sh
# 
#         USAGE: ./check_noclobber.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/28/2015 22:27
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ -o noclobber ]
then
	echo "Your files are protected against accidental \
		overwriting using redirection."
else
	echo "You did not set. Now, set it..."
	set -o noclobber
fi



