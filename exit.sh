#!/bin/sh

options=("CANCEL" "SHUTDOWN" "REBOOT" "EXIT")

choice=$(printf "%s\n" "${options[@]}" | dmenu -i -p "Choose: ")

case $choice in
    "SHUTDOWN")
        sure=$(echo -e "YES\nNO" | dmenu -i -p "SHUTDOWN!")
        [ "$sure" = "YES" ] && doas poweroff
        ;;
    "REBOOT")
        sure=$(echo -e "YES\nNO" | dmenu -i -p "REBOOT!")
        [ "$sure" = "YES" ] && doas reboot
        ;;
    "EXIT")
        sure=$(echo -e "YES\nNO" | dmenu -i -p "EXIT Dwm!")
        [ "$sure" = "YES" ] && pkill dwm
        ;;
    *)
        ;;
esac

