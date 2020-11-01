#!/bin/bash
# firacode for intellij
sudo apt install -y fonts-firacode fonts-powerline

# Ubuntu Mono Nerd for terminator / vim
FONTS_DIR=~/.local/share/fonts

mkdir -p $FONTS_DIR
curl -fLo $FONTS_DIR/"Ubuntu Mono Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo $FONTS_DIR/"Ubuntu Mono Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular-Italic/complete/Ubuntu%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo $FONTS_DIR/"Ubuntu Mono Bold Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold/complete/Ubuntu%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo $FONTS_DIR/"Ubuntu Mono Bold Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold-Italic/complete/Ubuntu%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
