#! /bin/bash

WIDTH=80
HEIGHT=25
if [ -n "$1" ];then
	WIDTH=$1
fi
if [ -n "$2" ];then
	HEIGHT=$2
fi
MENU_HEIGHT=$((HEIGHT-5))

SWD=`echo -n "$0" | sed -e "s/.nspgport.sh//"`;
nspggui_conf="$SWD/nspggui.conf"

num_pc=0
for pc in `cat $nspggui_conf | sed -e "/^#/d" -e "/^[ \t]*$/d"`;do
	PNIC[$num_pc]=`echo $pc | sed -e 's/;.*$//g'`
	PMAC[$num_pc]=`echo $pc | sed -e 's/^.*;//g'`
	num_pc=$(($num_pc + 1))
done

num_c=0
for c in `ifconfig | sed -e '/^[ \t\n\r]/d' -e '/^$/d' -e '/^lo/d' | awk '{print $1}'`;do
	NIC[$num_c]="$c"
	MAC[$num_c]="-"
	index=0
	while [ $index -lt $num_pc ];do
		if [ $c = ${PNIC[$index]} ];then
			MAC[$num_c]=${PMAC[$index]}
			break
		fi
		index=$(($index+1))
	done
	num_c=$(($num_c + 1))
done


: ${DIALOG=dialog}

backtitle="Ports Setting for Network Sending Packet Generator"

returncode=0

$DIALOG --clear

while test $returncode != 1 && test $returncode != 250; do
	DCMD=""
	index=0
	while [ $index -lt $num_c ];do
		DCMD="$DCMD ${NIC[$index]}= ${MAC[$index]}"
		index=$(($index + 1))
	done

	exec 3>&1
	value=`$DIALOG --ok-label "Apply" \
		--extra-label "Edit" \
		--backtitle "$backtitle" \
		--inputmenu "Port Setting (Enter destination MAC address; '-' means not to use that port) " \
		$HEIGHT $WIDTH $MENU_HEIGHT \
		$DCMD \
		2>&1 1>&3`
	returncode=$?
	exec 3>&-

	case $returncode in
	1)
		returncode=1
		;;
	0)
		echo "# # <interface_name>;<dest_mac>" > $nspggui_conf
		index=0
		while [ $index -lt $num_c ];do
			if [ -z ${MAC[$index]} -o ${MAC[$index]} = "-" ];then
				echo "#${NIC[$index]};" >> $nspggui_conf
			else
				echo "${NIC[$index]};${MAC[$index]}" >> $nspggui_conf
			fi
			index=$(($index + 1))
		done
		returncode=0
		break
		;;
	3)
		tag=`echo "$value" |sed -e 's/^RENAMED //' -e 's/=.*//'`
		item=`echo "$value" |sed -e 's/^.*=[ ]*//' -e 's/[ ]*$//'`

		index=0
		while [ $index -lt $num_c ];do
			if [ $tag = ${NIC[$index]} ];then
				MAC[$index]="$item"
			fi
			index=$(($index + 1))
		done
		;;

	255)
		echo "ESC pressed."
		break
		;;

	esac
done

exit $returncode

