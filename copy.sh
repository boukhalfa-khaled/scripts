#!/bin/sh	

choice=$(echo -e "Cancel\nOoredoo\nDjezzy\nsecondMail\nofficialMail" | dmenu -i -p "Choose Action: " )

if [ $choice = "Ooredoo" ]; then 
echo 	0540579810 | xclip -selection clipboard
elif [ $choice = "Djezzy" ]; then 
echo 	0798288907 | xclip -selection clipboard
elif [ $choice = "secondMail" ]; then 
echo 	"lsnoop75@gmail.com" | xclip -selection clipboard
elif [ $choice = "officialMail" ]; then 
echo 	boukhalfa.khaled.islam@gmail.com | xclip -selection clipboard
fi
