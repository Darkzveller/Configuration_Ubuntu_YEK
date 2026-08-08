#!/bin/bash

source ~/.bashrc

echo "=== Suppression de tout ce qu'il y a en rapport avec docker  ==="

sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc | cut -f1)

echo ""
echo "=== Ajout du dépôt officiel Docker ==="

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

echo ""
echo "=== Téléchargement de Docker Desktop ==="

curl -L \
    https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb \
    -o docker-desktop-amd64.deb

echo ""
echo "=== Installation de Docker Desktop ==="

sudo apt install -y ./docker-desktop-amd64.deb

echo ""
echo "=== Installation terminée ==="

echo "Docker version :"
docker --version

echo ""
echo "Docker Compose version :"
docker compose version