#!/bin/sh	

# sound port configuration pacmd --list-sinks
pacmd set-sink-port 0 analog-output-speaker
doas chmod 777 /sys/class/backlight/intel_backlight/brightness
clipmenud &
