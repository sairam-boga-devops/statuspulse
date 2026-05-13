#!/bin/bash

echo "Testing health endpoint..."
curl -f http://localhost:8000/health

echo ""
echo "Creating service..."

curl -X POST http://localhost:8000/services \
-H "Content-Type: application/json" \
-d '{
  "name":"Google",
  "url":"https://google.com"
}'

echo ""
echo "Listing services..."

curl http://localhost:8000/services

echo ""
echo "Creating incident..."

curl -X POST http://localhost:8000/incidents \
-H "Content-Type: application/json" \
-d '{
  "service_name":"Google",
  "title":"API Slow",
  "description":"Testing incident",
  "severity":"minor"
}'

echo ""
echo "Listing incidents..."

curl http://localhost:8000/incidents

echo ""
echo "Integration tests completed successfully."