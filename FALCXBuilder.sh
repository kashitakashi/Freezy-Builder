#!/bin/bash
apt update
apt dist-upgrade -y
apt install git -y
wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

mkdir /FreezyArena
git clone -b 2025-Reefscape-Week-0 https://github.com/cpapplefamily/freesy-arena.git /FreezyArena

cd /FreezyArena
echo "[Unit]
Description=Freezy Arena Services
[Service]
Type=Simple
RestartSec=1
ExecStart=/FreezyArena/cheesy-arena
WorkingDirectory=/FreezyArena/
[Install]
WantedBy=multi-user.target" > FreezyArena.service
go build

systemctl link /FreezyArena/FreezyArena.service
systemctl enable FreezyArena.service
systemctl start FreezyArena.service
