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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
./tools/zsh/tyoras-agitnoster-theme.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# node + yarn
./tools/nodejs.sh
npm i -g yarn

# ranger
./tools/ranger.sh

# nvim
echo -e "\n- Installing neovim settings"
sudo apt install -y neovim
pip install pynvim
npm i -g neovim
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-snippets coc-python coc-tsserver coc-html coc-css coc-json coc-yaml coc-metals coc-explorer --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
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

# stow dotfiles
echo -e "\n- Starting to stow dotfiles"
sudo apt install -y stow
stow -v -d stow -t ~ git htop terminator zsh ranger idea neovim bat tmux
