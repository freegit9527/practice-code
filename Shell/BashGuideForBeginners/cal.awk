#!/usr/bin/awk -f
#===============================================================================
#
#          File:  cal.awk
# 
#   Description:  
# 
#   VIM Version:  7.0+
#        Author:  YOUR NAME (), 
#  Organization:  
#       Version:  1.0
#       Created:  03/27/2015 09:14
#      Revision:  ---
#       License:  
#===============================================================================

BEGIN {
	print "Calculate column 1 and 2."
	total1 = 0;
	total2 = 0;
	}

{
	total1 += $1;
	total2 += $2;
	}

END {
	print "sum of column 1: " total1
	print "sum of column 2: " total2
	print "DONE"
	}
