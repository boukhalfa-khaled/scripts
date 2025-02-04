#!/bin/sh	


nmcli r wif on
wifiid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | dmenu -p "Select Wifia : " -l 20 | cut -d' ' -f1)
pass=$(echo "" | dmenu -p "Enter Password :")
nmcli device wifi connect $wifiid password $pass
