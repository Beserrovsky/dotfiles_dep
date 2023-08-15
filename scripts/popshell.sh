#!/bin/bash

# POP_OS Shell -> Tiling and Shortcuts
# Tutorial: https://github.com/pop-os/shell#installation

sudo apt install git node-typescript make
cd ~/.local
git clone https://github.com/pop-os/shell.git --depth 1
cd ./shell

# THIS WILL SHUTDOWN YOUR COMPUTER!
make local-install

# Enable it in extensions
sudo add-apt-repository universe
sudo apt install gnome-shell-extension-prefs
gnome-shell-extension-prefs
