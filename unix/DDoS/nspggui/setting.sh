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

SWD=`echo -n "$0" | sed -e "s/.setting.sh//"`;
setting_conf="$SWD/setting.conf"

generator=`grep generator $setting_conf | sed -e "s/.*=//g"`
duration=`grep duration $setting_conf | sed -e "s/.*=//g"`
pps=`grep pps $setting_conf | sed -e "s/.*=//g"`
smac=`grep smac $setting_conf | sed -e "s/.*=//g"`
destip=`grep destip $setting_conf | sed -e "s/.*=//g"`
destport=`grep destport $setting_conf | sed -e "s/.*=//g"`
sf_srcip=`grep sf_srcip $setting_conf | sed -e "s/.*=//g"`
ss_srcip=`grep ss_srcip $setting_conf | sed -e "s/.*=//g"`

: ${DIALOG=dialog}

backtitle="Configurations Setting for Network Sending Packet Generator"

returncode=0

m_generator="Generator (nspg,knspg)"
m_duration="Duration (seconds)"
m_pps="PPS (0-infinite)"
m_smac="Source MAC (eg-11 22 33 44 55 66)"
m_destip="Dest IP (eg-10.10.10.10)"
m_destport="Dest Port (eg-80)"
m_sf_srcip="Src IP for IP spoofing (eg-GG GG GG GG)"
m_ss_srcip="Src IP for Single Source (eg-1.2.3.4)"

$DIALOG --clear

while test $returncode != 1 && test $returncode != 250
do
exec 3>&1
value=`$DIALOG --ok-label "Apply" \
	--extra-label "Edit" \
	  --backtitle "$backtitle" \
	  --inputmenu "Configuration Setting" \
$HEIGHT $WIDTH $MENU_HEIGHT \
	"$m_generator:"	"$generator" \
	"$m_duration:"	"$duration" \
	"$m_pps:"	"$pps" \
	"$m_smac:"	"$smac" \
	"$m_destip:"	"$destip" \
	"$m_destport:"	"$destport" \
	"$m_sf_srcip:"	"$sf_srcip" \
	"$m_ss_srcip:"	"$ss_srcip" \
2>&1 1>&3`
returncode=$?
exec 3>&-

	case $returncode in
	1)
		returncode=1
		;;
	0)
#		"$DIALOG" \
#		--clear \
#		--backtitle "$backtitle" \
#		--msgbox "duration=<$duration>\n\
#			pps=<$pps>\n\
#			destip=<$destip>\n\
#			destport=<$destport>\n\
#			sf_srcip=<$sf_srcip>\n\
#			ss_srcip=<$ss_srcip>\n\
#			" 20 80
		echo "# $setting_conf" > $setting_conf
		echo "generator=$generator" >> $setting_conf
		echo "duration=$duration" >> $setting_conf
		echo "pps=$pps" >> $setting_conf
		echo "smac=$smac" >> $setting_conf
		echo "destip=$destip" >> $setting_conf
		echo "destport=$destport" >> $setting_conf
		echo "sf_srcip=$sf_srcip" >> $setting_conf
		echo "ss_srcip=$ss_srcip" >> $setting_conf
		returncode=0
		break
		;;
	3)
		tag=`echo "$value" |sed -e 's/^RENAMED //' -e 's/:.*//'`
		item=`echo "$value" |sed -e 's/^.*:[ ]*//' -e 's/[ ]*$//'`

		case "$tag" in
		"$m_generator")
			case "$item" in
			"nspg" | "knspg")
				generator="$item"
				;;
			*)
				generator="nspg"
				;;
			esac
			;;
		"$m_duration")
			duration="$item"
			;;
		"$m_pps")
			pps="$item"
			;;
		"$m_smac")
			smac="$item"
			;;
		"$m_destip")
			destip="$item"
			;;
		"$m_destport")
			destport="$item"
			;;
		"$m_sf_srcip")
			sf_srcip="$item"
			;;
		"$m_ss_srcip")
			ss_srcip="$item"
			;;
		esac
		;;

	255)
		echo "ESC pressed."
		break
		;;

	esac
done

exit $returncode

