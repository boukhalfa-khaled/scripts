#!/bin/sh

#  CC:FB:33:31:08:B3

select=$(bluetoothctl devices | awk {'print $3'} | dmenu  )
	MAC=$(bluetoothctl devices | grep $select | awk {'print $2'}) 
#	[ -z $MAC ] && MAC=NoDeviceFound # Prevents accidental disconnect error

connect=$(bluetoothctl info $MAC | grep Connected: | awk '{print $2}')
if [[ $connect = no ]]; then 
		echo "Attempting to connect to $select" | dmenu
			bluetoothctl connect $MAC | tail -n 1 | dmenu 
elif [[ $connect = yes ]]; then
    sure=$(echo -e "YES\nNO" | dmenu -i -p "Attempting to disconnect $select")
    [ "$sure" = "YES" ] &&	bluetoothctl disconnect $MAC | tail -n 1 | dmenu 
fi
## bluetoothctl show if powered : no
## run this :
## sudo rfkill unblock bluetooth 

