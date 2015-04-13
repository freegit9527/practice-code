#!/usr/bin/awk -f
#===============================================================================
#
#          File:  ofsAors.awk
# 
#   Description:  
# 
#   VIM Version:  7.0+
#        Author:  YOUR NAME (), 
#  Organization:  
#       Version:  1.0
#       Created:  03/27/2015 09:07
#      Revision:  ---
#       License:  
#===============================================================================
BEGIN {
	OFS=";";
	ORS="\n-->\n"
	}

{
	print "Record: " NR "-->" $1,$2
}

END {
	print "Processed " NR " records in total."
	}
