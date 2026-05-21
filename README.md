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

Лабораторийн орчин бэлдэх зааварчилгаа
Урьдчилсан шаардлага
Ubuntu 22.04
Docker engine 
Docker compose plugin
Git
Docker суулгах ба тохируулах
Алхам 1: Системийг шинэчлэх
Docker суулгахаас өмнө Ubuntu системийг бүрэн шинэчлэнэ. Энэ нь хамгийн сүүлийн хувилбарын пакетуудыг суулгахад шаардлагатай: 
sudo apt update & sudo  upgrade -y
Алхам 2: Docker суулгах
Ubuntu-ийн албан ёсны репозиторийгоос Docker-ийг суулгана:  
sudo apt install -y docker.io 
Docker үйлчилгээг системтэй цуг автоматаар эхлэх тохиргоо хийнэ: 
sudo systemctl enable docker
sudo systemctl start docker
Docker амжилттай ажиллаж байгаа эсэхийг шалгана: 
sudo systemctl status docker
Active: active (running) гэж харагдвал Docker амжилттай суусан. 
Алхам 3: Docker Compose Plugin суулгах 
Docker Compose нь олон контейнерийг нэг docker-compose.yml файлаар хамтад нь удирдах боломжийг олгодог хэрэгсэл юм. Манай дадлагад зургаан контейнерийг нэгэн зэрэг ажиллуулахад ашиглана: 
sudo apt install -y docker-compose-plugin
Суулгасны дараа хувилбарыг шалгана: 
docker compose version
Алхам 4: Хэрэглэгчийн Docker бүлэгт нэмэх 
Анхдагч байдлаар Docker командуудыг ажиллуулахад root эрх буюу sudo шаардагддаг.   Хэрэглэгчийг docker бүлэгт нэмснээр sudo бичихгүйгээр docker командуудыг ашиглах боломжтой болно: 
sudo usermod -aG docker $USER 
Энэ өөрчлөлт хүчин төгөлдөр болохын тулд заавал logout хийж дахин нэвтэрнэ: 
	logout
	Дахин нэвтэрсний дараа docker бүлэгт орсон эсэхийг шалгана: 
		Groups
	sudo-гүйгээр docker ажилладаг эсэхийг туршина: 
		Docker ps
Алхам 5: Git суулгах 
Git нь хувилбар хяналтын систем бөгөөд дадлагын орчны бүх тохиргооны файлуудыг GitHub-с татахад ашиглана: 
sudo apt install git -y
Git амжилттай суусан эсэхийг шалгана: 
	Git –version
Алхам 6: Ажлын гүйцэтгэх хавтас үүсгэнэ
Home directory дотор дадлагын орчны файлуудыг хадгалах тусгай хавтас үүсгэнэ: 
mkdir -p ~/cyber-range
Алхам 7: Репозиторийг clone хийх 
GitHub-с дадлагын орчны бүх тохиргооны файлуудыг татна. USERNAME-ийг өөрийн GitHub хэрэглэгчийн нэрээр солино: 
git clone https://github.com/Lablana/CyberRangeCZ 
Татаж авсан файлуудыг харна:
cd ~/cyber-range
Алхам 8: Docker image-уудыг татах
Docker Image нь контейнерийн загвар юм. Нэг image-аас олон контейнер үүсгэж болно. Дараах дөрвөн image-ийг татна: 
sudo docker pull kalilinux/kali-rolling:latest
sudo docker pull vulnerables/web-dvwa:latest
sudo docker pull mysql:5.7
sudo docker pull ubuntu:22.04 
Татсан image-үүдийг харна:
	docker image
Алхам 9: Docker compose build хийх
docker-compose.yml файлын тохиргооны дагуу контейнерүүдийг build хийнэ. Энэ алхамд тусгай тохиргоо, суулгалтуудыг container дотор хийнэ: 
cd ~/cyber-range
sudo docker compose build 
Build процесс интернэтийн хурдаас хамаарч 5–15 минут үргэлжилж болно. 
Алхам 10: Containar-уудыг асаах
Бүх контейнерийг арын горимд нэгэн зэрэг асаана: 
sudo docker compose up -d 


Алхам 11: Container Status Шалгах 
Бүх контейнер зөв ажиллаж байгаа эсэхийг шалгана: 
sudo docker compose ps 
Сүлжээний тохиргоог шалгана — IP хаягууд зөв тогтоогдсон эсэх: 

IP хаягууд 
Kali-192.168.100.10
NGINX Proxy-192.168.100.50
WordPress-192.168.100.20
MySQL Database-192.168.100.21
Client User-192.168.100.30
Monitor-192.168.100.40


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
