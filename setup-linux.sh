#!/bin/bash

DOT_FILES=( .zsh .zshrc* .gitconfig .dir_colors .vimrc .vim .tmux.conf .tmux-powerlinerc .ideavimrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# tmux-powerline
git clone git://github.com/erikw/tmux-powerline.git ~/dotfiles
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git
sudo cp -r RictyDiminished-for-Powerline/ /usr/local/share/fonts/  
fc-cache -fv

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

# for tmux-mem-cpu-load
git clone https://github.com/thewtex/tmux-mem-cpu-load.git
cd ~/dotfiles/tmux-mem-cpu-load/
cmake .
make
sudo make install
rm -rf ~/dotfiles/tmux-mem-cpu-load/

# Ruby関連
# http://qiita.com/mogulla3/items/42a7f6c73fa4a90b1df3

# for rsense
source ./scripts/rsense.sh
