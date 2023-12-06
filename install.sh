#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "\nStarting installation"
echo -e "\nPassword for sudo commands"
# Ask for the administrator password upfront
sudo -v

sudo apt update
sudo apt install -y curl wget build-essential libxext-dev xsel

# console
./tools/fonts.sh
sudo apt install -y terminator python3-pygments bat
mkdir -p ~/.local/bin
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
sudo wget https://github.com/dandavison/delta/releases/download/0.11.2/git-delta_0.11.2_amd64.deb -O /tmp/delta.deb
sudo dpkg -i /tmp/delta.deb
# fzf
sudo apt install -y fzf ripgrep universal-ctags silversearcher-ag fd-find

# zsh
echo -e "\n- Installing zsh settings"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
./tools/zsh/tyoras-agitnoster-theme.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# neovim
echo -e "\n- Installing neovim settings"
sudo snap install nvim --classiic
cd ${BASEDIR}

#tmux
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# tools
echo -e "\n- Starting to install tools"
sudo apt install -y htop
./tools/ctop.sh
./tools/postman.sh
./tools/jvm.sh
./tools/nodejs.sh
npm i -g yarn

# stow dotfiles
echo -e "\n- Starting to stow dotfiles"
sudo apt install -y stow
stow -v -d stow -t ~ git htop terminator zsh ranger idea neovim bat tmux
