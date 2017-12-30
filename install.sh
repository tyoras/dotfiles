#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
#ln -s ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
#ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
ln -sfv ${BASEDIR}/git/.gitconfig ~
ln -sfv ${BASEDIR}/git/.gitignore_global ~

# tools
./tools/postman.sh

