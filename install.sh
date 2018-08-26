#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "\nStarting installation"
echo -e "\nPassword for sudo commands"
# Ask for the administrator password upfront
sudo -v

sudo apt update

# git
echo -e "\n- Installing git settings"
sudo apt install -y git
ln -sfv ${BASEDIR}/git/.gitconfig ~
ln -sfv ${BASEDIR}/git/.gitignore_global ~

# console
./console/fonts.sh
sudo apt install -y terminator

# vim
echo -e "\n- Installing vim settings"
sudo apt install -y vim
#ln -s ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim
# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# install vim-airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
# install nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# install nerdtree-git-plugin 
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
# install vim-devicons
git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons

# zsh
echo -e "\n- Installing zsh settings"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#ln -s ${BASEDIR}/zshrc ~/.zshrc

# tools
echo -e "\n- Starting to install tools"
./tools/ctop.sh
./tools/postman.sh

