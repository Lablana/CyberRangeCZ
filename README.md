# CyberRangeCZ Lightweight Web Compromise Lab

CyberRangeCZ нь Docker-т суурилсан lightweight cyber range (хөнгөн жинтэй кибер лаборатори) бөгөөд wordPress CMS, MySQL database (өгөгдлийн сан), NGINX reverse proxy, Zeek network security monitoring зэрэг бүрэлдэхүүнүүдийг ашиглан Web compromise, Reconnaissance, SQL injection, packet analysis, log analysis зэрэг кибер аюулгүй байдлын туршилтуудыг хийх боломжтой орчин юм.

Энэхүү лаборатори нь Ubuntu virtual machine дээр ажиллах боломжтой бөгөөд Docker container architecture-ийг ашигласнаар lightweight resource usage (бага нөөц ашиглалт), дахин ашиглах боломжтой, тусгаарлагдсан орчин зэрэг давуу талуудтай.

---

# Architecture

```text
Kali Linux Attacker
        ↓
NGINX Reverse Proxy
        ↓
WordPress CMS
        ↓
MySQL Database
        ↓
Monitor Container
 ├── Zeek
 ├── tcpdump
```

---

# Components

## Kali Linux

Kali Linux container нь penetration testing (нэвтрэлтийн тест)-ийн орчин болж ажиллана.

Ашиглагдсан tools:

- Nmap
- WPScan
- SQLMap
- Hydra
- Netcat
- tcpdump

---

## WordPress CMS

WordPress нь халдлагын үндсэн target system (бай систем) болно.

Энэхүү CMS орчин дээр:

- CMS Enumeration
- Authentication Attack
- SQL Injection
- Web Compromise
- Plugin Enumeration

зэргийг турших боломжтой.

---

## MySQL Database

MySQL нь WordPress backend database (арын өгөгдлийн сан)-ийн үүргийг гүйцэтгэнэ.

MySQL дотор:

- User accounts
- Password hashes
- CMS content
- Authentication data

хадгалагдана.

---

## NGINX Reverse Proxy

NGINX нь reverse proxy (урвуу proxy)-ийн үүрэгтэй.

```text
Client → NGINX → WordPress
```

структур үүсгэснээр:

- HTTP traffic forwarding
- Access logging
- Request inspection
- Reverse proxy analysis

хийх боломж бүрдэнэ.

---

## Monitor Container

Monitor container нь monitoring stack (хяналтын орчин)-ийг агуулна.

Үүнд:

- Zeek
- tcpdump

суулгасан.

Энэхүү container нь:

- Packet capture
- IDS/IPS monitoring
- HTTP traffic analysis
- Connection logging

хийдэг.

---

# Quick Start

# Лабораторийн орчин бэлтгэх заавар

## Алхам 1 — Ubuntu системийг шинэчлэх

Docker суулгахаас өмнө Ubuntu системийг бүрэн шинэчлэх шаардлагатай.

```bash
sudo apt update && sudo apt upgrade -y
```

---

## Алхам 2 — Docker engine суулгах

Docker engine нь контейнерүүдийг ажиллуулах үндсэн орчин болно.

```bash
sudo apt install -y docker.io
```

Docker service-ийг систем асах үед автоматаар эхлэх тохиргоо хийнэ.

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Docker зөв ажиллаж байгаа эсэхийг шалгана.

```bash
sudo systemctl status docker
```

Хэрэв:

```text
Active: active (running)
```

гэж харагдвал Docker амжилттай суусан гэсэн үг.

---

## Алхам 3 — Docker compose plugin суулгах

Docker compose нь олон container-ийг нэг docker-compose.yml файлаар удирдах боломж олгодог.

```bash
sudo apt install -y docker-compose-plugin
```

Суулгасны дараа version шалгана.

```bash
docker compose version
```

---

## Алхам 4 — User-ийг Docker group-д нэмэх

Docker command-уудыг sudo-гүй ашиглахын тулд хэрэглэгчийг docker group-д нэмнэ.

```bash
sudo usermod -aG docker $USER
```

Дараа нь logout/login хийнэ.

```bash
logout
```

Дахин нэвтэрсний дараа docker зөв ажиллаж байгаа эсэхийг шалгана.

```bash
docker ps
```

---

## Алхам 5 — Git суулгах

Git нь GitHub repository clone хийхэд ашиглагдана.

```bash
sudo apt install git -y
```

Version шалгана.

```bash
git --version
```

---

## Алхам 6 — Ажлын хавтас үүсгэх

CyberRangeCZ лабораторийн файлуудыг хадгалах хавтас үүсгэнэ.

```bash
mkdir -p ~/cyber-range
cd ~/cyber-range
```

---

## Алхам 7 — GitHub Repository clone хийх

CyberRangeCZ repository-г GitHub-с татаж авна.

```bash
git clone https://github.com/Lablana/CyberRangeCZ
```

Repository руу орно.

```bash
cd CyberRangeCZ
```

---

## Алхам 8 — Docker Image-үүдийг татах

Docker image-үүдийг урьдчилан татна.

```bash
sudo docker pull kalilinux/kali-rolling:latest
sudo docker pull mysql:5.7
sudo docker pull ubuntu:22.04
sudo docker pull nginx:latest
sudo docker pull wordpress:latest
```

Татсан image-үүдийг шалгана.

```bash
docker images
```

---

## Алхам 9 — Docker Image build хийх

docker-compose.yml файл дээр үндэслэн бүх container-ийг build хийнэ.

```bash
sudo docker compose build --no-cache
```

Энэ процесс internet speed болон hardware performance-оос хамаарч хэдэн минут үргэлжилж болно.

---

## Алхам 10 — Container-уудыг асаах

Бүх container-ийг background mode-д эхлүүлнэ.

```bash
sudo docker compose up -d --remove-orphans
```

---

## Алхам 11 — Container Status шалгах

Container-ууд зөв ажиллаж байгаа эсэхийг шалгана.

```bash
sudo docker compose ps
```

Ажиллаж буй container-ууд:

- kali_attacker
- wordpress_cms
- wordpress_mysql
- nginx_proxy
- monitor_tcpdump
- client_user

---

## Алхам 12 — Docker Network шалгах

Docker network болон IP address-уудыг шалгана.

```bash
sudo docker network ls
```

Дараа нь:

```bash
sudo docker network inspect cyber-range_cyberlab
```

---

# Лабораторийн IP Address

| Service | IP Address |
|---|---|
| Kali Linux | 192.168.100.10 |
| WordPress CMS | 192.168.100.20 |
| MySQL Database | 192.168.100.21 |
| Client User | 192.168.100.30 |
| Monitor Container | 192.168.100.40 |
| NGINX Reverse Proxy | 192.168.100.50 |

---

# WordPress Setup

Browser дээр:

```text
http://192.168.100.50
```

хаягаар орж WordPress installer ажиллуулна.

Жишээ administrator account:

| Field | Value |
|---|---|
| Username | adminn |
| Password | admin123 |
| Email | adminn@lab.local |

---

# Kali Container руу нэвтрэх

Kali Linux attacker container руу дараах command-аар орно.

```bash
sudo docker exec -it kali_attacker bash
```

---

# Monitor Container руу нэвтрэх

Zeek болон monitoring logs шалгахдаа:

```bash
sudo docker exec -it monitor_tcpdump bash
```

---

# Educational Purpose

Энэхүү лаборатори нь зөвхөн:

- Cybersecurity education
- Penetration testing practice
- IDS/IPS monitoring
- Network traffic analysis
- Threat hunting research

зорилгоор ашиглагдана.

Зөвхөн isolated laboratory environment (тусгаарлагдсан лабораторийн орчин)-д ашиглах ёстой.

---

# Disclaimer

This project is intended strictly for educational and research purposes. Unauthorized use against systems without explicit permission is illegal and unethical.

Use responsibly.
