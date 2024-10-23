#!/bin/bash

# Requesting user inputs for the source folder, backup folder, and retention days
read -p "Enter the source folder (e.g., /path/to/source/folder): " SOURCE
read -p "Enter the backup folder (e.g., /path/to/backup/folder): " BACKUP
read -p "Enter the number of retention days for backup (e.g., 7): " RETENTION_DAYS
LOGFILE="$BACKUP/backup_log_$(date +%Y-%m-%d).log"

# Get the current date
DATE=$(date +%Y-%m-%d)

# Function for backup
backup() {
    echo "[$(date)] Starting backup from $SOURCE to $BACKUP ..." >> "$LOGFILE"
    tar -czf "$BACKUP/backup-$DATE.tar.gz" "$SOURCE" >> "$LOGFILE" 2>&1
    if [[ $? -eq 0 ]]; then
        echo "[$(date)] Backup completed successfully!" >> "$LOGFILE"
    else
        echo "[$(date)] Backup failed!" >> "$LOGFILE"
        send_notification "Backup failed for $SOURCE on $DATE"
    fi
}

# Function to clean up old backups
cleanup_old_backups() {
    echo "[$(date)] Cleaning up backups older than $RETENTION_DAYS days ..." >> "$LOGFILE"
    find "$BACKUP" -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;
    echo "[$(date)] Old backups deleted successfully." >> "$LOGFILE"
}

# Function to send notifications
send_notification() {
    local MESSAGE=$1
    echo "[$(date)] Sending notification: $MESSAGE" >> "$LOGFILE"
    
    # Example notification via email (requires mail command to be set up)
    # Uncomment the next line to use email notification
    # echo "$MESSAGE" | mail -s "Backup Script Notification" your-email@example.com

    # Simple terminal notification (echo)
    echo "$MESSAGE"
}

# Main function to execute all tasks
main() {
    backup                # Perform the backup
    cleanup_old_backups    # Clean up old backups
}

# Execute the main function
main
