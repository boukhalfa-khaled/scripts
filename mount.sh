#!/bin/sh	

choice=$(echo -e "Cancel\nUSB\nPhone" | dmenu -i -p "Choose Device: " )

if [ $choice = "USB" ]; then 
	~/scripts/usbmount.sh
elif [ $choice = "Phone" ]; then 
	~/scripts/phonemount.sh
fi
