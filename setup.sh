#!/bin/bash

show_usage() {
	cat <<-EOF
		USAGE) $0 [-h|--help] [-r|--replace]
		OPTIONS:
		    -r    replace existing files to symbolic links
		    -h    show this message
	EOF
}

# check opts
while getopts rh OPT; do
	case $OPT in
		r) replace=0 ; shift 1;;
		h) show_usage; exit 0;;
		\?) show_usage; exit 1;;
	esac
done
shift $((OPTIND - 1))

# setup ruby-build for rbenv
mkdir -p .rbenv/plugins
if [ ! -e .rbenv/plugins/ruby-build ]; then
	ln -s `pwd`/ruby-build .rbenv/plugins/ruby-build
fi

# setup cask
function cask_install() {
	pushd $(dirname $0)/.emacs.d
	cask
	popd
}

if [ `uname -s` == Darwin* ]; then
	brew install cask
	cask_install
elif [ `uname -s` == Linux* ]; then
	curl -fsSkL https://raw.github.com/cask/cask/master/go | python
	cask_install
elif [ `uname -s` == CYGWIN* -o `uname -s` == MINGW32_NT* ]; then
	echo <<-EOF
		Install cask manually on Windows.
		@see http://cask.readthedocs.org/en/latest/guide/installation.html#windows-setup
	EOF
fi

# make symbolic links
COUNT=0
DOTFILES=(
	.zprofile
	.zshrc
	.gitconfig
	.gitignore
	.emacs.d
	.hgrc
	.tmux.conf
	z
	.rbenv
	.peco
	k
)
for file in ${DOTFILES[@]} ;do
	dest=$HOME/$file
	if [ $replace ]; then
		if [ -e $dest ]; then rm $dest; fi
	fi
	if [ ! -e $dest ]; then
		ln -s $(cd $(dirname $0) && pwd)/$file $dest
		echo -e "created $dest -> $(cd $(dirname $0) && pwd)/$file"
		COUNT=$(( COUNT + 1 ))
	fi
done

echo -e "----------------------------"
echo -e "\033[1;32mcreated $COUNT links\033[0m"
