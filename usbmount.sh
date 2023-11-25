#!/bin/sh

# Get user and group IDs
uid=$(id -u)
gid=$(id -g)

# Find USB devices
usbdev=$(ls -l /sys/dev/block/ | awk -F"/" '($6~"usb" && $15~"sd") {print "/dev/"$15}')

if [ -n "$usbdev" ]; then
    # List USB drives and ask user to select one
    selected=$(
        lsblk -rno size,name,mountpoint "$usbdev" | \
        awk '($1!~"M" && $1!~"K") {printf "%s%8s%12s\n", $2, $1, $3}' | \
        dmenu -l 5 -i -p "USB Drives: " | awk '{print $1}'
    )

    if grep -qs "$selected" /proc/mounts; then
        # Drive is already mounted, unmount it
        sync
        doas umount "/dev/$selected"
        grep -qs "/mnt/$selected" /proc/mounts || doas rm -rf "/mnt/$selected"
    else
        # Drive is not mounted, mount it
        [ ! -d "/mnt/$selected" ] && doas mkdir "/mnt/$selected"
        doas mount -o uid="$uid",gid="$gid" "/dev/$selected" "/mnt/$selected"
    fi
else
    echo "No drives connected" | dmenu -i -p "USB Drives: "
    exit
fi

