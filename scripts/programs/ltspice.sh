#!/bin/bash

echo "Installing LTSpice XVII..."

sudo apt update
sudo apt install wine-stable

cd /opt
sudo mkdir LTSpice
cd ./LTSpice

sudo wget https://ltspice.analog.com/software/LTspice64.exe

wine ./LTspice64.exe

