# Security Policy

## Overview

This project follows security best practices for containerized cloud-native applications.

Security measures implemented include:

- HTTPS SSL/TLS encryption
- Security headers via Nginx
- Rate limiting protection
- Docker container isolation
- Automated vulnerability scanning using Trivy
- Secrets excluded using .gitignore
- Health monitoring and alerting
- CI/CD security checks
- Automated rollback on deployment failure

---

# Supported Versions

| Version | Supported |
|----------|------------|
| 1.0.x    | Yes        |

---

# Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly.

Contact:
- Email: security@statuspulse.local

Please include:
- Vulnerability description
- Steps to reproduce
- Impact assessment
- Suggested remediation

---

# Security Controls Implemented

## HTTPS & TLS

- SSL certificates generated using Let's Encrypt
- HTTPS enforced via Nginx reverse proxy
- TLS certificate monitoring enabled in Uptime Kuma

---

## Security Headers

Configured HTTP security headers:

- Strict-Transport-Security
- X-Frame-Options
- X-Content-Type-Options
- Content-Security-Policy
- Referrer-Policy

---

## Rate Limiting

Nginx rate limiting enabled to reduce abuse and brute-force attacks.

Example:

```nginx
limit_req_zone $binary_remote_addr zone=api_limit:10m rate=10r/s;


Container Security
Minimal Docker image size
Non-root runtime best practices
Multi-container isolation
Docker Compose network isolation
Secrets Management

Sensitive files excluded using .gitignore.

Protected files include:

.env
*.pem

Git history verified to ensure secrets were never committed.

Vulnerability Scanning

Trivy vulnerability scans performed on:

Docker images
Source filesystem

Reports stored in repository.

Example commands:

trivy image statuspulse-app
trivy fs .
Monitoring & Alerting

Implemented using Uptime Kuma.

Monitored services:

StatusPulse API
PostgreSQL
Redis
TLS Certificate expiry

Alert channels:

Discord
Email
Backup Security

Automated PostgreSQL backups scheduled using cron jobs.

Backups retained and rotated automatically.

CI/CD Security

GitHub Actions pipeline includes:

Automated deployment
Health verification
Rollback on failure
Secure SSH deployment
SHA-tagged container images
Security Best Practices
Keep dependencies updated
Rotate credentials regularly
Restrict SSH access
Use least privilege principle
Monitor logs regularly
Review vulnerability scan reports periodically
Verification Commands
Verify TLS
curl -vI https://statuspulse-sairam-boga-devops.duckdns.org
Verify Security Headers
curl -I https://statuspulse-sairam-boga-devops.duckdns.org/health
Verify Rate Limiting
for i in $(seq 1 120); do curl -s -o /dev/null -w "%{http_code}\n" https://statuspulse-sairam-boga-devops.duckdns.org/health; done

Expected response:

429