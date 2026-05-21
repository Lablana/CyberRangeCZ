# CyberRangeCZ Lightweight Web Compromise Lab

Docker-based lightweight cyber range environment for:

- WordPress security testing
- SQL Injection labs
- Reconnaissance
- Zeek monitoring
- Suricata IDS/IPS
- Packet analysis

## Architecture

Kali Linux
↓
NGINX Reverse Proxy
↓
WordPress CMS
↓
MySQL Database
↓
Zeek monitoring

## Quick Start

### Build

```bash
docker compose build --no-cache
```

### Start

```bash
docker compose up -d
```

### Stop

```bash
docker compose down
```

## Default Network

192.168.100.0/24

## Components

- Kali Linux
- WordPress
- MySQL
- NGINX
- Zeek
- tcpdump
- tshark
## Educational Purpose

This laboratory environment is intended strictly for:

- Cybersecurity education
- Penetration testing practice
- Network monitoring research
- IDS/IPS analysis

Use only in isolated lab environments.
