#!/bin/bash

DOT_FILES=( .zsh .zshrc .gitconfig .vimrc .vim .tmux.conf )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

