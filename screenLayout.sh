#!/bin/sh	

choice=$(echo -e "Cancel\nDuplicate\nUp\nRight\nLeft" | dmenu -i -p "Where Is The Second Screen ?" )

if [ $choice = "Duplicate" ]; then 
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
elif [ $choice = "Up" ]; then 
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1121 --rotate normal --output DP1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
elif [ $choice = "Right" ]; then 
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --mode 1920x1080 --pos 1988x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
elif [ $choice = "Left" ]; then 
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 1981x0 --rotate normal --output DP1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
fi
