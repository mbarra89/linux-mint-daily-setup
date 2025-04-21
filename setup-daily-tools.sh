#!/bin/bash

set -e

echo "Actualizando paquetes..."
sudo apt update && sudo apt upgrade -y

echo "Instalando VLC desde los repos oficiales..."
sudo apt install -y vlc

echo "Instalando Flatpak (si no está instalado)..."
sudo apt install -y flatpak

echo "Agregando Flathub si no está agregado..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Instalando Discord, Spotify, Obsidian y Steam desde Flathub..."
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub com.valvesoftware.Steam

echo "Instalando Google Chrome desde repositorio oficial..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo "Instalando Ulauncher (tipo Spotlight para Linux)..."
sudo add-apt-repository -y ppa:agornostal/ulauncher
sudo apt update
sudo apt install -y ulauncher

echo "¡Listo! Todas tus herramientas diarias están instaladas. Reinicia o ejecuta Ulauncher con: ulauncher"
