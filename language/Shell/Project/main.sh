#!/bin/bash - 
#===============================================================================
#
#          FILE: main.sh
# 
#         USAGE: ./main.sh 
# 
#   DESCRIPTION: A CD manager. Add, remove, check a record or a track in a record.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: liuxueyang (lxy), liuxueyang457@163.com
#  ORGANIZATION: Hunan University
#       CREATED: 03/26/2014 20:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

temp_file="cdb.$$"
title_file="title.cdb"
tracks_file="tracks.cdb"

rm -f temp_file
if [ ! -f $title_file ]; then
	touch $title_file
fi

if [ ! -f $tracks_file ]; then
	touch $tracks_file
fi

clear
echo
echo
echo Mini CD manager
sleep 1

set_menu_choice()
{
	clear
	echo "Options :-"
	echo
	echo " 	a) Add new CD"
	echo " 	f) Find CD"
	echo " 	c) Count the CDs and tracks in the catalog"
	echo " 	q) Quit"
	echo 
	echo -n "Please enter choice then press return: "
	read menu_choice
	return
}

get_confirm()
{
	echo -n "Are you Sure? "
	while :
	do
		read x
		case "$x" in
			[yY] | [yY][eE][sS] )
				return 0
				;;
			[nN] | [nN][oO] )
				echo "Cancelled"
				echo
				return 1
				;;
			* )
				echo "Please enter yes or no!"
		esac
	done
}

insert_title()
{
	echo $* >> $title_file
}

insert_track()
{
	echo $* >> $tracks_file
}

list_tracks()
{
	grep "^${cdcatnum}" $tracks_file > $temp_file
	num_tracks=${wc -l $temp_file}
	if [ "$num_tracks" = "0" ]; then 
		echo "No tracks found for $cdtitle"
	else
		{
			echo 
			echo "$cdtitle :-"
			echo 
			cut -f 2- -d , $temp_file
			echo
		} | ${PAGER:-more}
	fi
}

find_cd()
{
	if [ "$1" = "n" ]; then
		asklist=n
	else
		asklist=y
	fi
	cdcatnum=""
	echo -n "Enter a string to search for in the CD titles"
	read searchstr
	if [ "$searchstr" = "" ]; then
		return 0
	fi

	grep "$searchstr" $title_file > $temp_file
	set $(wc -l $temp_file)
	linesfound=$1

	case "$linesfound" in 
		0 )
			echo "Sorry, nothing found"
			return 0
			;;
		1)
			;;
		2 )
			echo "Sorry, not unique."
			echo "Found the following"
			cat $temp_file
			return 0
			;;
	esac
	IFS=","
	read cdcatnum cdtitle cdtype cdac < $temp_file
	IFS=" "

	echo
	echo "Catalog number: $cdcatnum"
	echo "Title: $cdtitle"
	echo "Type: $cdtype"
	echo "Artist/Composer: $cdac"
	echo

	if [ "$asklist" = "y" ]; then
		echo -n "View tracks for this CD? "
		read x
		case "$x" in 
			[yY] | [yY][eE][sS] ) 
				echo
				list_tracks
				echo
				;;
			[nN] | [nN][oO] )
				;;
		esac
	fi
}

remove_records()
{
	if [ -z "$cdcatnum" ]; then
		echo "You must select a CD first"
		find_cd n
	fi
}

add_records_tracks()
{
	echo "Enter track information for this CD"
	echo "When no more tracks enter q"
	cdtrack=1
	cdttitle=""
	while [ "$cdttitle" != "q" ]
	do
		echo -n "Track $cdtrack, track title? "
		read tmp
		cdttitle=${tmp%%,*}
		if [ "$cdttitle" != "$tmp" ]; then
			echo "Sorry, no commas allowed"
			continue
		fi
		if [ -n "$cdttitle" ]; then
			if [ "$cdttitle" != "q" ]; then
				insert_track $cdcatnum,$cdtrack,$cdttitle
				cdtrack=$(($cdtrack+1))
			fi
		fi
	done
}

add_records()
{
	echo -n "Enter catalog name: "
	read tmp 
	cdcatnum=${tmp%%,*}

	echo -n "Enter title: "
	read tmp 
	cdtitle=${tmp%%,*}

	echo -n "Enter type: "
	read tmp
	cdtype=${tmp%%,*}

	echo -n "Enter artist/composer: "
	read tmp
	cdac=${tmp%%,*}

	echo "About to add new Entry!"
	echo "$cdcatnum $cdtitle $cdtype $cdac"

	if get_confirm; then
		insert_title $cdcatnum,$cdtitle,$cdtype,$cdac
		add_records_tracks
	else
		remove_records
	fi
}

quit=n
while [ "$quit" != "q" ]
do
	set_menu_choice
	case "$menu_choice" in 
		a) 
			add_records
			;;
		r)
			echo r
			;;
		f)
			echo f
			;;
		u)
			echo u
			;;
		c)
			echo c
			;;
		l)
			echo l
			;;
		b)
			echo b
			;;
		[qQ])
			quit=q
			echo q
			;;
		*)
			echo "Sorry, choice not recongnized."
			;;
	esac
done

exit 0
