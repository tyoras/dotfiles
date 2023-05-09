#!/bin/bash

echo -e "\n- Installing node"
wget -qO- https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
