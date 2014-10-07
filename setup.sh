#!/bin/bash

# tmuxのMac 用クリップボード設定
ln -s $HOME/dotfiles/bin $HOME/bin

DOT_FILES=( .zsh .zshrc* .gitconfig .dir_colors .vimrc .vim .tmux.conf )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
