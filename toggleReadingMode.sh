#!/bin/sh

# Define the path to a file that will store the state
STATE_FILE="/tmp/ToggleReadingMode" 

# check if the state file exists and read the state
if [ ! -f "$STATE_FILE" ]; then
    # if the file doesnt' exist, assume Redshift is off and set to 5000
    redshift -P -O 5000 &
    echo "true" >  "$STATE_FILE"
else
    # if the file exists, reset to default and remove the file
    redshift -x & 
    rm "$STATE_FILE"
fi

