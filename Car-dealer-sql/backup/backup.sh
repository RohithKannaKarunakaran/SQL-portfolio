#!/bin/bash

USER="root"
PASSWORD="password"
NAME="awesome"
BACKUP_DIR="/home/kanna/Documents/backup"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/${NAME}_$DATE.sql"

# Dump the database into a SQL file
sudo mysqldump -u $USER -p $PASSWORD $NAME > $BACKUP_FILE

# compress the backup file to save space
gzip $BACKUP_FILE

# Log the backup
echo "Backup for database $DB_NAME completed on $DATE" >> "$BACKUP_DIR/backup.log"
