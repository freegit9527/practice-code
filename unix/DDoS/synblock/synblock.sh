#!/bin/bash
# SynBlock v0.4 - English

. /usr/local/synblock/synblock.conf


clear;

#Logo Funktion
function start ()
{

#echo;
#echo "  ##############################";
#echo "  #      www.Anti-Hack.net     #";
#echo "  #    SynBlock Version 0.4    #";
#echo "  #      by Florian Reith      #";
#echo "  ##############################";
echo "                       _     _            _    ";
echo "       ___ _   _ _ __ | |__ | | ___   ___| | __";
echo "      / __| | | | '_ \| '_ \| |/ _ \ / __| |/ /";
echo "      \__ \ |_| | | | | |_) | | (_) | (__|   < ";
echo '      |___/\__, |_| |_|_.__/|_|\___/ \___|_|\_\';
#echo '           |___/';
#echo;

}

#Funktion um IP Liste zu blocken
function blockcount ()
{
for ipcount in $(sed '/^[ \t]*$/d' $BADLST | wc -l);
do
echo $DATUM Modul_blockcount: $? >> $INST/log
done;
}

#Funktion um IP-Blockliste zu z�hlen (Zeilen bzw. IP's)
function iptbanlst ()
{
for ip in $(sed '/^[ \t]*$/d' $BADLST);
do
$IPT -I INPUT -s $ip -j DROP;
done;
}

#Antispoofing - Verwirft Pakete in denen Quell u. Ziel Ipadresse keinen Sinn ergeben.
function antispoofing ()
{
for a in /proc/sys/net/ipv4/conf/*/rp_filter;
do
echo 1 > $a
echo $DATUM Modul_Antispoof: $? >> $INST/log
done
}


#Funktion fuer IPtables Konfiguration
function ipcfg ()
{
$INST/iptables.sh;
echo $DATUM Modul_iptables: $? >> $INST/log
}


#Funktion um alle Befehle aufzulisten
function zbefehle ()
{

echo "  .--------|___/-----------------------------------."
echo "  |  > Start SynBlock Monitor                  | -m |"
echo "  |  > Create IPtables security rules:         | -i |"
echo "  |  > Remove all IPtables rules:              | -f |"
echo "  |  > Block all IPs from bad.lst:             | -b |"
echo "  |  > Syctl.conf Tuning:                      | -t |"
echo "  |  > Enable Antispoofing:	               | -a |"
echo "  |  > Quit: 			               | -q |"
echo "  '------------------------------------------------'"

}


#Funktion um sysctl.conf tuning vorzunehmen
function tuning()
{
echo "1" > /proc/sys/net/ipv4/tcp_syncookies
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "2" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "1" > /proc/sys/net/ipv4/conf/all/log_martians
echo "30" > /proc/sys/net/ipv4/tcp_fin_timeout
echo "1800" > /proc/sys/net/ipv4/tcp_keepalive_time
echo "0" > /proc/sys/net/ipv4/tcp_window_scaling
echo "0" > /proc/sys/net/ipv4/tcp_sack
echo "1280" > /proc/sys/net/ipv4/tcp_max_syn_backlog
echo "3" > /proc/sys/net/ipv4/tcp_synack_retries
echo "1" > /proc/sys/net/ipv4/tcp_abort_on_overflow
echo "3" > /proc/sys/net/ipv4/tcp_retries1
echo "3" > /proc/sys/net/ipv4/tcp_syn_retries
sysctl -p
echo $DATUM Modul_sysctl_tuning: $? >> $INST/log
}

case "$1" in

     -t | -tuning | t | tuning)
	    #Hier werden einige Aenderungen an der sysctl.conf vorgenommen!
            start;
            zbefehle;
            tuning;
	    echo "  Status:"
	    echo "  .---------------------------------------."
            echo "  | 	    sysctl.conf tuning - done!	    |"
	    echo "  '---------------------------------------'"
            echo;

            ;;


     -b | -block | -blocken | block | blocken | b)
            #Blocken der Bad.lst + Ausgabe der geblockten IP's!
            start;
            zbefehle;
            iptbanlst;
	    blockcount;
            echo "  Status:"
            echo "  .------------------------------------------."
            echo "  | There were $ipcount IP addresses blocked |"
            echo "  '------------------------------------------'"
            echo;

		;;


	-m | -monitor | -mon | monitor | m)
            #Monitor starten!
            start;
            zbefehle;
	    $INST/monitor.sh
            echo "  Status:"
            echo "  .------------------------------------------."
            echo "  | There were $ipcount IP addresses blocked |"
            echo "  '------------------------------------------'"
            echo;

            ;;


     -q | quit | -quit | q)
            #SynBlock beenden bzw. Bildschirm zur�cksetzen
            reset;
            ;;

     -f | -flush | f | flush | leeren | -leeren)
            #Iptables leeren
	    start;
            zbefehle;
            iptables -F synblock_banned >/dev/null 2>&1;
            iptables -X synblock_banned >/dev/null 2>&1;
            iptables -F synblock_rules >/dev/null 2>&1;
            iptables -X synblock_rules >/dev/null 2>&1;
echo $CHAIN;
            echo "  Status:"
            echo "  .--------------------------------."
            echo "  |        IPtables flushed!       |"
            echo "  '--------------------------------'"
            echo;
            ;;

     -a | anti | antispoofing | -antispoofing | -anti | a)
            #Antispoofing
            start;
            zbefehle;
            antispoofing;
            echo "  Status:"
            echo "  .--------------------------------."
            echo "  |     Anti-Spoofing enabled!    |"
            echo "  '--------------------------------'"
            echo;
            ;;


     -i | -iptables | iptables | i)
            #Iptables Einstellungen vornehmen
            start;
            zbefehle;
            echo "  Status:";
            ipcfg;
            echo;
            ;;

     *)
            #Wenn Befehl nicht vorhanden/gefunden - Hilfe ausgeben
            start;
            zbefehle;
	    echo;
             ;;
esac
exit 0
