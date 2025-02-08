#!/bin/bash
apt update
apt dist-upgrade -y
apt install git -y
git clone https://github.com/kashitakashi/Freezy-Builder.git .
wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

mkdir /FreezyArena

git clone -b 2025-Reefscape-Week-0 https://github.com/cpapplefamily/freesy-arena.git /FreezyArena
cp ./FreezyArena.service /FreezyArena
cd /FreezyArena
go build

systemctl link /FreezArena/FreezyArena.service
