#!/bin/sh

options=("SUSPEND" "SHUTDOWN" "LOCK" "REBOOT" "EXIT")

choice=$(printf "%s\n" "${options[@]}" | dmenu -i -p "CHOOSE: ")

case $choice in
    "SUSPEND")
        sure=$(echo -e "YES\nNO" | dmenu -i -p "SUSPEND!")
        if [ "$sure" = "YES" ]; then
          xsecurelock &       
          sleep 1             
          systemctl suspend   
        fi
        ;;    "LOCK")
        sure=$(echo -e "YES\nNO" | dmenu -i -p "LOCK!")
        [ "$sure" = "YES" ] && xsecurelock
        ;;
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


