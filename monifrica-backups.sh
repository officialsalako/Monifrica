#!/bin/bash

BACKUP_DIR="/monifrica-backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Ensure the backup directory exists
sudo mkdir -p "$BACKUP_DIR"
sudo chmod 777 "$BACKUP_DIR"

# Backup files
echo "Backing up files..."
sudo tar -czvf "$BACKUP_DIR/files_$TIMESTAMP.tar.gz" /var/www/html 2>/dev/null

# Backup database (if applicable)
echo "Backing up database..."
DB_NAME="your_database_name" # Replace with the actual database name
DB_USER="root"              # Replace with your database user
DB_PASS="your_password"     # Replace with your database password
sudo mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/db_$TIMESTAMP.sql" 2>/dev/null

echo "Backup completed!"






























