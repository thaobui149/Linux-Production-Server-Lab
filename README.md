# Linux Production Server Lab

## Overview

**Linux Production Server Lab** is a hands-on project that simulates a small production Linux server environment.
The goal of this lab is to demonstrate practical **Linux System Administration skills**, including service deployment, system security, monitoring, and automated backups.

This project represents a simplified infrastructure commonly used in small companies where a Linux server hosts containerized services and is monitored for performance and reliability.

The entire setup was built on **Ubuntu Server 22.04 running on a virtual machine**.

---

# Architecture

```
Client (Browser)
        ↓
Ubuntu Server (prod-server)
        ├─ Docker
        │   └─ Nginx Container (Web Service)
        │
        ├─ Monitoring
        │   └─ Netdata Dashboard
        │
        └─ Backup System
            └─ Bash Script + Cron Job
```

---

# Technologies Used

* **Ubuntu Server 22.04**
* **Docker**
* **Docker Compose**
* **Nginx**
* **Netdata Monitoring**
* **Bash scripting**
* **Cron scheduling**
* **UFW Firewall**
* **Fail2ban**
* **SSH key authentication**

---

# Project Objectives

This lab demonstrates the following system administration skills:

* Linux server setup and configuration
* Service deployment using Docker containers
* Server security hardening
* System monitoring
* Backup automation
* Troubleshooting common server issues

---

# Day 1 — Linux Server Setup & Security

Basic Linux server configuration and security hardening.

### Tasks completed

* Installed **Ubuntu Server 22.04**
* Configured server hostname
* Updated system packages

```
sudo apt update
sudo apt upgrade
```

* Installed essential tools

```
curl
git
vim
htop
net-tools
```

* Created administrative user

```
adduser admin
usermod -aG sudo admin
```

* Configured **SSH key authentication**
* Disabled root SSH login
* Disabled password authentication

SSH configuration example:

```
PermitRootLogin no
PasswordAuthentication no
```

* Configured **UFW firewall**

```
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
```

* Installed **Fail2ban** to protect against brute-force attacks.

---

# Day 2 — Docker & Container Deployment

Docker was installed to run services in isolated containers.

### Docker Installation

```
sudo apt install docker.io
sudo systemctl enable docker
sudo systemctl start docker
```

User was added to the docker group:

```
sudo usermod -aG docker ubuntu
```

Docker Compose was installed:

```
sudo apt install docker-compose
```

### Container Deployment

A simple web service was deployed using **Nginx container**.

`docker-compose.yml`

```
version: '3'

services:
  web:
    image: nginx:alpine
    container_name: web
    restart: always
    ports:
      - "80:80"
```

Run containers:

```
docker-compose up -d
```

Verify running containers:

```
docker ps
```

Result:

A web server running inside a Docker container accessible via:

```
http://SERVER-IP
```

---

# Day 3 — Monitoring System

System monitoring was implemented using **Netdata**.

### Netdata Installation

```
bash <(curl -sSL https://get.netdata.cloud/kickstart.sh)
```

Open firewall port:

```
sudo ufw allow 19999
```

Access monitoring dashboard:

```
http://SERVER-IP:19999
```

### Metrics monitored

* CPU usage
* RAM usage
* Disk usage
* Network traffic
* Docker containers
* System processes

This allows real-time visibility into server performance.

---

# Day 4 — Backup Automation

A backup system was implemented using **Bash scripting and Cron**.

### Backup directory

```
/opt/backups
```

### Backup script

`scripts/backup.sh`

```
#!/bin/bash

DATE=$(date +%F)

mkdir -p /opt/backups/$DATE

docker ps > /opt/backups/$DATE/containers.txt

tar -czf /opt/backups/$DATE/docker-config.tar.gz /opt/docker
```

Make script executable:

```
chmod +x /opt/backups/backup.sh
```

### Cron Job

Automated daily backup at **02:00 AM**.

```
crontab -e
```

```
0 2 * * * /opt/backups/backup.sh
```

This ensures automatic backup of container configuration and system state.

---

# Troubleshooting Scenarios

### Docker permission denied

Problem:

```
docker: permission denied while trying to connect to the Docker daemon
```

Solution:

```
sudo usermod -aG docker ubuntu
```

Log out and log back in.

---

### Netdata dashboard not accessible

Problem:

Port blocked by firewall.

Solution:

```
sudo ufw allow 19999
```

---

### Container not running

Check container status:

```
docker ps -a
```

View container logs:

```
docker logs container_name
```

---

# Skills Demonstrated

* Linux server administration
* Containerized service deployment
* Docker and Docker Compose usage
* System monitoring
* Backup automation
* Server security configuration
* Troubleshooting production issues

---

# Future Improvements

Potential improvements for this project include:

* Deploying **Prometheus + Grafana monitoring stack**
* Adding **HTTPS with Let's Encrypt**
* Implementing **CI/CD pipeline**
* Deploying services with **Kubernetes**
* Adding centralized logging (ELK stack)

---

# Conclusion

This lab simulates a real-world Linux production server environment.
It demonstrates essential skills required for a **Junior Linux System Administrator** role, including container management, system monitoring, security hardening, and automated backup strategies.
