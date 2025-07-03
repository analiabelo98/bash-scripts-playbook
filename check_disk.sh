#!/bin/bash


#Purpose: Monitor disk usage and warn if it exceeds a given threshold
#Usage: ./check_disk.sh [threshold_percentage]


#Set default threshold if not provided
THRESHOLD=${1:-80}
#echo $THRESHOLD

#Get disk usage percentage
DISK_USAGE=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')
#echo $DISK_USAGE

#Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
	echo "[ALERT] Disk usage is above threshold: ${DISK_USAGE}% used."
else
	echo "Disk usage OK: ${DISK_USAGE}% used."
fi


