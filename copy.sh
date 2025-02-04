#!/bin/sh	

choice=$(echo -e "Cancel\nOoredoo\nDjezzy\nsecondMail\nofficialMail" | dmenu -i -p "Choose Action: " )

if [ $choice = "Ooredoo" ]; then 
echo 	0500000000 | xclip -selection clipboard
elif [ $choice = "Djezzy" ]; then 
echo 	0700000000 | xclip -selection clipboard
elif [ $choice = "secondMail" ]; then 
echo 	"cristianoRonaldo1999@gmail.com" | xclip -selection clipboard
elif [ $choice = "officialMail" ]; then 
echo 	"name@gmail.com" | xclip -selection clipboard
fi
