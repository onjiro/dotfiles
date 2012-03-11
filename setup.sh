#!/bin/bash

DOT_FILES=( .zprofile .zshrc .gitconfig .gitignore .emacs .emacs.d .hgrc )

for file in ${DOT_FILES[@]}
do
    ln -s $(cd $(dirname $0) && pwd)/$file $HOME/$file
done
