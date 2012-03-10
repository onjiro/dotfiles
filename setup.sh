#!/bin/bash

DOT_FILES=( .profile .zshrc .gitconfig .gitignore .emacs .emacs.d .hgrc )

for file in ${DOT_FILES[@]}
do
    ln -s $(dirname $0)/$file $HOME/$file
done
