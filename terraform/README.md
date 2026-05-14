# Terraform Infrastructure Setup

## Overview

This Terraform configuration provisions the infrastructure required for the StatusPulse DevOps project on AWS.

Infrastructure created:

- EC2 Ubuntu Server
- Security Group / Firewall Rules
- Public IP Outputs
- Configurable Variables

---

# Files

| File | Purpose |
|------|----------|
| main.tf | Main infrastructure resources |
| variables.tf | Input variables with defaults |
| terraform.tfvars | Environment-specific values |
| outputs.tf | Terraform outputs |

---

# Resources Created

## EC2 Instance

- Ubuntu Server
- Docker host for StatusPulse deployment

## Security Group

Opens required ports:

| Port | Purpose |
|------|----------|
| 22 | SSH |
| 80 | HTTP |
| 443 | HTTPS |
| 8000 | StatusPulse API |
| 3001 | Uptime Kuma |

---

# Prerequisites

Install:

- Terraform
- AWS CLI
- AWS Account
- AWS Access Keys

---

# Configure AWS Credentials

Run:

```bash id="a1"
aws configure