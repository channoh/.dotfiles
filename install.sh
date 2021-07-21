#!/bin/bash

TARGET=("bash_profile" "bashrc" "ctags" "gitconfig" "gitignore" "tmux.conf" "vim" "vimrc")

SRC_PATH=$( dirname "${BASH_SOURCE[0]}" )
echo ${SRC_PATH}

for t in ${TARGET[@]}; do
    rm -rf $HOME/.$t
    ln -s ${SRC_PATH}/$t $HOME/.$t
    echo $t" is changed"
done

## SSH
ln -s $PWD/.ssh/config $HOME/.ssh/config

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
