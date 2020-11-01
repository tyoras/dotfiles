#!/bin/bash

sudo apt install -y ranger
mkdir -p ~/.config/ranger/plugins
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
pip install ueberzug

