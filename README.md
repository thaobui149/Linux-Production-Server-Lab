# Linux Production Server Lab

## Overview

This project simulates a **small production-like Linux server environment** built on **Ubuntu Server 22.04**.

The goal of this lab is to demonstrate practical **Linux System Administration skills**, including:

* Container deployment with Docker
* System monitoring
* Server security configuration
* Automated backups

This repository represents a simplified production setup commonly used in real-world environments.

---

## Architecture

The following diagram illustrates how the components interact within the lab environment.

![Architecture Diagram](architecture/architecture-diagram.png)

### System Flow

User → Internet → Ubuntu Server

### Services Running on the Server

**Docker**

* Nginx container (web service)

**Monitoring**

* Netdata dashboard

**Backup System**

* Bash backup script
* Cron scheduled automation

---

## Technologies Used

* Ubuntu Server 22.04
* Docker
* Docker Compose
* Nginx
* Netdata Monitoring
* Bash scripting
* Cron scheduling
* UFW Firewall
* Fail2ban
* SSH key authentication

---

## Features

### Containerized Web Service

A web server is deployed using Docker. The application runs inside an **Nginx container** and exposes **port 80** to the host system.

![Docker Containers](docs/docker-containers.png)

To start the web service, run:

```bash
docker-compose up -d
```

Docker Compose launches the Nginx container which serves the web application.

---

### System Monitoring

The server is monitored using **Netdata**, which provides real-time visibility into system performance and resource usage.

Netdata helps detect performance issues and monitor server health in real time.

![Netdata Dashboard](docs/netdata-dashboard.png)

Netdata collects metrics for:

* CPU usage
* RAM usage
* Disk I/O
* Network traffic
* Docker containers

Access the Netdata dashboard:

```
http://<SERVER-IP>:19999
```

---

### Backup Automation

Server configuration files are automatically backed up using a **Bash backup script**.

Backups are scheduled daily using **cron** to ensure regular snapshots of important configuration files.

![Cron Backup](docs/cron-backup.png)

Backup script location:

```
/opt/backups/backup.sh
```

Cron schedule:

```bash
0 2 * * * /opt/backups/backup.sh
```

This runs the backup script **every day at 02:00 AM**.

---

## Setup

Clone the repository:

```bash
git clone https://github.com/your-username/Linux-Production-Server-Lab.git
cd Linux-Production-Server-Lab
```

Start the web service:

```bash
docker-compose up -d
```

Verify running containers:

```bash
docker ps
```

---

## Skills Demonstrated

* Linux server administration
* Container deployment with Docker
* System monitoring configuration
* Backup automation with Bash and Cron
* Server security configuration
* Troubleshooting production issues

---

## Conclusion

This project demonstrates how to build and manage a simplified **Linux production server environment**.

It highlights core responsibilities of a **Linux System Administrator**, including:

* Container deployment
* System monitoring
* Backup automation
* Basic server security
