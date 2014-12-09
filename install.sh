#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ $? -ne 0 ]
then
    echo "error: fail to clone Vundle, Vim plugin manager."
    exit 1
fi

ln -s $DIR/vimrc ~/.vimrc
if [ $? -ne 0 ]
then
    echo "error: fail to create link to Vim configuration file."
    exit 2
fi

echo "Start install plugins..."
vim +PluginInstall +qall
echo "ok: install plugins sucessfully."

echo "Please checkout the Installation guide of YouCompleteMe:"
echo "https://github.com/Valloric/YouCompleteMe"

exit 0
