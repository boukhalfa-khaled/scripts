#!/bin/sh

arg=$1
cur=$(cat /sys/class/backlight/intel_backlight/brightness)
max='900'

if [ $arg = "up" ]; then
    if [ $cur = 900 ]; then 
        echo "max"
    else
        next=$((cur+100))
        echo $next > /sys/class/backlight/intel_backlight/brightness
    fi
elif [ $arg = "down" ]; then
    if [ $cur = 100 ]; then 
        echo "min"
    else
        next=$((cur-100))
        echo $next > /sys/class/backlight/intel_backlight/brightness
    fi
fi
