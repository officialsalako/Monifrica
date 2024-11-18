#!/bin/bash

BACKUP_DIR="/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup files
tar -czvf $BACKUP_DIR/files_$TIMESTAMP.tar.gz /var/www/html

# Backup database (if applicable)
mysqldump -u root -p database_name > $BACKUP_DIR/db_$TIMESTAMP.sql

echo "Backup completed!"





























