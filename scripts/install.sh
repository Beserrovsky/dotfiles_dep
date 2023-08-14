#!/bin/bash

# TODO: ADD SOFTWARE
# - Obsidian
# - Tmux
# - Tor

# Copy dotfiles
./copy.sh

cd /tmp

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install awscli
install chrome-gnome-shell
install curl
install file
install git
install gh
install htop
install jq
install nmap
install openvpn
install tree
install vim
install wget
install neofetch

sudo add-apt-repository universe
install gnome-tweaks
install gnome-shell-extension-manager

# Image processing
install gimp
install jpegoptim
install optipng

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
