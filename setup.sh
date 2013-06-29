#!/bin/bash

show_usage() {
    echo "USAGE) $0 [-h|--help] [-r|--replace]"
    echo "OPTIONS:"
    echo "    -r --replace    replace existing files to symbolic links"
    echo "    -h --help       show this message"
}

# check opts
OPTS=`getopt -o rh -l replace,help -- $*`
if [ $? != 0 ]; then show_usage; exit 1; fi
eval set -- $OPTS
while [ -n "$1" ]; do
  case $1 in
    -r|--replace) replace=0 ; shift 1;;
    -h|--help) show_usage; exit 0;;
    --) shift; break;;
    *) echo "Unknown option($1) used."; exit 1;;
  esac
done

# setup ruby-build for rbenv
mkdir -p .rbenv/plugins
ln -s `pwd`/ruby-build .rbenv/plugins/ruby-build

# make symbolic links
DOT_FILES=( .zprofile .zshrc .gitconfig .gitignore .emacs.d .hgrc .tmux.conf z .rbenv)
for file in ${DOT_FILES[@]}; do
    dest=$HOME/$file
    if [ $replace ]; then
        if [ -e $dest ]; then rm $dest; fi
    fi
    if [ ! -e $dest ]; then
        ln -s $(cd $(dirname $0) && pwd)/$file $dest
    fi
done
