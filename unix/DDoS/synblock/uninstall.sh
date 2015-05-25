#!/bin/sh
# SynBlock v0.4 - English
echo; echo "Removing SynBlock"
echo; echo; echo -n "Removing Files....."
if [ -e '/usr/local/sbin/synblock' ]; then
	rm -f /usr/local/sbin/synblock
	echo -n ".."
fi
if [ -d '/usr/local/synblock' ]; then
	rm -rf /usr/local/synblock
	echo -n ".."
fi
echo "done"
        ip=`hostname -i`;
echo "Synblock removed (Host: $ip)" | mail -s "SynBlock Version 0.4 removed" synblock@reith.in
echo; echo "uninstall completely"; echo "Visit www.Anti-Hack.net"; echo
wget --no-cache --quiet 'http://tracker.anti-hack.net/synblock.php?version=0.4&action=uninstall' >/dev/null 2>&1
