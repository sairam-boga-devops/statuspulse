#!/bin/bash

BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR

echo "Starting PostgreSQL backup..."

docker exec statuspulse-postgres-1 pg_dump -U statuspulse statuspulse > $BACKUP_DIR/statuspulse_$TIMESTAMP.sql

echo "Backup completed successfully."

find $BACKUP_DIR -type f -mtime +7 -delete

echo "Old backups cleaned."