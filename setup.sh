#!/bin/bash

# tmuxのMac 用クリップボード設定
ln -s $HOME/dotfiles/bin $HOME/bin

DOT_FILES=( .zsh .zshrc* .gitconfig .dir_colors .vimrc .vim .tmux.conf .tmux-powerlinerc )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

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
