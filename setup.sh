#!/bin/bash

DOT_FILES=( .zsh.d .zsh .zshrc* .gitconfig .dir_colors .vimrc .vim .tmux.conf .ideavimrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# tmux-powerline
pip install powerline-status
git clone https://github.com/powerline/fonts.git 
fonts/install.sh
rm -rf fonts
mkdir -p ~/.config/powerline
cp -r /usr/local/lib/python2.7/site-packages/powerline/config_files/* ~/.config/powerline

# fzf: Install shell extensions
/usr/local/opt/fzf/install

#mkdir -p ~/.vim/bundle
#git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
#git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
#
## for tmux-mem-cpu-load
#git clone https://github.com/thewtex/tmux-mem-cpu-load.git
#cd ~/dotfiles/tmux-mem-cpu-load/
#cmake .
#make
#sudo make install
#rm -rf ~/dotfiles/tmux-mem-cpu-load/
#
## Ruby関連
## http://qiita.com/mogulla3/items/42a7f6c73fa4a90b1df3
#
## for rsense
#source ./scripts/rsense.sh
