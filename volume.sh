#!/bin/sh

arg=$1
[ $arg = "up"	  ] && pamixer -i 10
[ $arg = "down"	  ] && pamixer -d 10
[ $arg = "toggle" ] && pamixer -t 
[ $arg = "toggle" ] && pkill -RTMIN+20 "${STATUSBAR:-dwmblocks}"

pkill -RTMIN+10 "${STATUSBAR:-dwmblocks}"
