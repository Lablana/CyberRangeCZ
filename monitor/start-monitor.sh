#!/bin/bash

ip link set eth0 promisc on

echo "[+] Starting Zeek..."

/opt/zeek/bin/zeekctl deploy

echo "[+] Starting tcpdump capture..."

tcpdump -i eth0 -w /pcaps/capture.pcap &

echo "[+] Monitor Ready"

tail -f /dev/null
