#!/bin/bash

set -e

LOG_FILE="$HOME/statuspulse-deploy.log"
APP_DIR="$HOME/statuspulse"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a $LOG_FILE
}

log "Starting deployment..."

cd $APP_DIR

log "Pulling latest code from GitHub..."
git pull origin main

log "Stopping old containers..."
docker compose down

log "Starting updated containers..."
docker compose up -d --build

log "Waiting for application health check..."
sleep 15

HEALTH=$(curl -s http://localhost:8000/health | grep healthy || true)

if [ -n "$HEALTH" ]; then
    log "Health check successful."
    log "Deployment completed successfully."
else
    log "Health check failed. Rolling back..."

    docker compose down

    git reset --hard HEAD~1

    docker compose up -d --build

    log "Rollback completed."
    exit 1
fi