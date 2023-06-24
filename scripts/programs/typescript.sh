#!/bin/bash

MY_PATH=$(dirname "$0")

echo "Installing TypeScript..."
if ! command -v npm &> /dev/null
then
    echo "npm could not be found, installing"
    $MY_PATH/nodejs.sh
    exit
fi

sudo npm install --global typescript