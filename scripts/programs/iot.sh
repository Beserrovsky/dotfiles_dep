#!/bin/bash

echo "Installing IoT stuff..."
if ! command -v pip &> /dev/null
then
    echo "pip could not be found, installing"
    $MY_PATH/python3.sh
    exit
fi

sudo apt install -y esptool picocom
sudo pip install adafruit-ampy
