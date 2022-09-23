#!/bin/bash

echo "Installing TypeScript..."
if ! command -v npm &> /dev/null
then
    echo "npm could not be found, installing"
    sudo apt install -y nodejs npm
    exit
fi

sudo npm install --global typescript