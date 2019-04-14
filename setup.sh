#!/bin/bash

#Symbolic Link
set -u
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY=".config"

echo "link home directory dotfiles"
cd ${DOT_DIRECTORY}
for f in .??*
do
    #無視したいファイルやディレクトリ
    [ "$f" = ".git" ] && continue
    [ "$f" = ".config" ] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "link .config directory dotfiles"
cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
for file in `\find . -maxdepth 8 -type f`; do
#./の2文字を削除するためにfile:2としている
    ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
done

echo "linked dotfiles complete!"

#Install
sudo apt install vim
sudo apt install git

#Install tmux
sudo apt install tmux
sudo gem install rubygems-update
sudo update_rubygems
sudo gem install tmuxinator

#Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Install tex
sudo apt-get install texlive-full
sudo apt-get install latexmk

#Install tig
sudo apt-get install libncurses5-dev 
sudo apt-get install automake
cd ${HOME}
git clone git://github.com/jonas/tig.git
cd tig
./autogen.sh
./configure --without-ncurses #For Japanese
make
sudo make install
cd ${HOME}
rm -rf tig

#Mozc
sudo apt-get install ibus-mozc
killall ibus-daemon
ibus-daemon -d -x &

# Install powerline fonts for vim-airline
## Change terminal fonts to powerline fonts
## Fonts "DejaVu Sans Mono for Powerline Book"
cd @{HOME}
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
