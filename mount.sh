#!/bin/sh	

choice=$(echo -e "Cancel\nBluetooth\nUSB\nPhone" | dmenu -i -p "Choose Device: " )

if [ $choice = "Bluetooth" ]; then 
	~/scripts/bluetooth.sh
elif [ $choice = "USB" ]; then 
	~/scripts/usbmount.sh
elif [ $choice = "Phone" ]; then 
	~/scripts/phonemount.sh
fi

