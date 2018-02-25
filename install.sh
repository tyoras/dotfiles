#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "\nStarting installation"
echo -e "\nPassword for sudo commands"
# Ask for the administrator password upfront
sudo -v

# vim
echo -e "\n- Installing vim settings"
#ln -s ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline

# zsh
#echo -e "\n- Installing zsh settings"
#ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
echo -e "\n- Installing git settings"
ln -sfv ${BASEDIR}/git/.gitconfig ~
ln -sfv ${BASEDIR}/git/.gitignore_global ~

# tools
echo -e "\n- Starting to install tools"
./tools/ctop.sh
./tools/postman.sh

