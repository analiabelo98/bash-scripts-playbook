#!/bin/bash


#Purpose: Automate directory backups with timestamped folders
#Usage: -/backup.sh <source_dir> <target_dir>
#

#Check if both arguments are proveided
if [ $# -lt 2 ]; then
	echo "Usage: $0 <source_directory> <target_directory>"
	exit 1
fi

SOURCE_DIR=$1
TARGET_DIR=$2
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$TARGET_DIR/backup_$TIMESTAMP"
LOG_FILE="$TARGET_DIR/backup_$TIMESTAMP.log"

echo "Starting backup for $SOURCE_DIR"
echo "Backup will be saved on $BACKUP_DIR"
echo "Log fle: $LOG_FILE"

#Create backup dir
mkdir -p "$BACKUP_DIR"
echo "Backup started at $(date)" > "$LOG_FILE"

#Perform the backup using rsync
rsync -a --info=progress2 "$SOURCE_DIR/" "$BACKUP_DIR/" >> "$LOG_FILE" 2>&1

#log completition status
if [ $? -eq 0 ]; then
	echo "Backup completed successfully" >> "$LOG_FILE"
	echo "Backup completed successfully. Files saved in $BACKUP_DIR"
else
	echo "Backup failed." >> "$LOG_FILE"
	echo "Error: Backup failed."
fi

echo "log file saved to $LOG_FILE"

