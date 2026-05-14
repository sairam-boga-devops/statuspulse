#!/bin/bash

APP_URL="https://statuspulse-sairam-boga-devops.duckdns.org/health"
LOG_FILE="$HOME/health-monitor.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $APP_URL)

if [ "$STATUS" -eq 200 ]; then
    echo "$TIMESTAMP - Application is healthy." >> $LOG_FILE
else
    echo "$TIMESTAMP - Application health check FAILED." >> $LOG_FILE
fi