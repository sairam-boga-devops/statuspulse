# StatusPulse DevOps Project

## Overview

StatusPulse is a containerized monitoring and incident management application deployed on AWS EC2 using Docker Compose with CI/CD automation, monitoring, alerting, SSL security, and backup automation.

---

# Live URLs

## Application
https://statuspulse-sairam-boga-devops.duckdns.org

## Monitoring Dashboard
https://uptime-kuma-sairam-boga-devops.duckdns.org

## Public Status Page
https://uptime-kuma-sairam-boga-devops.duckdns.org/status/statuspulse-status

---

# Architecture Diagram

```text
                ┌────────────────────┐
                │      GitHub        │
                │  Source Repository │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │ GitHub Actions CI  │
                │ Build/Test/Deploy  │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │   AWS EC2 Server   │
                │ Ubuntu 24.04 LTS   │
                └─────────┬──────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌──────────────┐ ┌──────────────┐ ┌────────────────┐
│ StatusPulse  │ │ PostgreSQL   │ │ Redis          │
│ FastAPI App  │ │ Database     │ │ Cache          │
└──────────────┘ └──────────────┘ └────────────────┘
                          │
                          ▼
                ┌────────────────────┐
                │     Nginx + SSL    │
                │ Reverse Proxy      │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │   Uptime Kuma      │
                │ Monitoring & Alerts│
                └────────────────────┘
Technologies Used:

Python FastAPI
Docker & Docker Compose
PostgreSQL
Redis
Nginx
Let's Encrypt SSL
GitHub Actions
AWS EC2
Uptime Kuma
Trivy Security Scanner

Prerequisites:

Docker
Docker Compose
Git
AWS EC2 Ubuntu Server
Domain/Subdomain
Nginx
Certbot

Run Locally
Clone Repository
git clone <repo-url>
cd statuspulse
Start Containers
docker compose up -d --build
Verify Services
docker compose ps
Access Application
http://localhost:8000
Production Deployment
Deploy on AWS EC2
Launch Ubuntu EC2 instance
Install Docker & Docker Compose
Clone repository
Configure Nginx reverse proxy
Configure SSL using Certbot
Start services
docker compose up -d --build
CI/CD Pipeline

GitHub Actions pipeline performs:

Code checkout
Docker image build
SHA tagged image creation
Push image to GitHub Container Registry
SSH deployment to AWS EC2
Health checks
Automatic rollback on failure
Discord notifications
Email notifications

Workflow file:

.github/workflows/deploy.yml
Monitoring & Alerting

Monitoring implemented using Uptime Kuma.

Configured monitors:

StatusPulse Health Endpoint
PostgreSQL TCP Check
Redis TCP Check
TLS Certificate Monitoring

Alert Channels:

Discord Webhooks
Email SMTP Alerts

Public status page enabled.

Backup & Restore
Backup

Run backup manually:

bash scripts/backup.sh

Automated daily backup configured using cron.

Restore

Restore PostgreSQL backup:

docker exec -i statuspulse-postgres psql -U postgres < backup.sql
Security

Implemented security controls:

HTTPS SSL/TLS
Security Headers
Rate Limiting
Trivy Vulnerability Scanning
Secrets excluded using .gitignore
Integration Testing

Run tests:

make test

Tests include:

GET /health
GET /incidents
POST /services
JSON validation
HTTP status verification
Troubleshooting
Containers Not Starting
docker compose logs
Nginx Errors
sudo nginx -t
SSL Issues
sudo certbot renew --dry-run
Health Check Failure
curl http://localhost:8000/health
Restart Services
docker compose restart
Useful Commands
View Containers
docker ps
View Logs
docker compose logs -f
Stop Services
docker compose down
Start Services
docker compose up -d