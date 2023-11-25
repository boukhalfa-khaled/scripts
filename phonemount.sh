#!/bin/sh

connectedPhones=$(simple-mtpfs -l)
mountedPhones=$(ls ~/cell/)

if [ -n "$connectedPhones" ]; then
    selectedDevice=$(echo "$connectedPhones" | dmenu -l 5 -i -p "Your phone is: " | awk '{print $1}')

    if [ -n "$selectedDevice" ]; then
        if [ -n "$mountedPhones" ]; then
            sync
            fusermount -u ~/cell/
        else
            sync
            simple-mtpfs -o --device "$selectedDevice" ~/cell/
        fi
    fi
else
    echo "No phone connected" | dmenu -i -p "Phone: "
    exit
fi

