#!/bin/bash

# A very basic script that makes the appropriate links:

function create_new_link() {
	if [[ ! -e $1\/$3 ]]
	then
		ln -s `pwd`\/$2 $1\/$3
	fi
}

HOME=~
declare -a COPY_TO_HOME=(gitconfig gvimrc vim vimrc Xdefaults xxkbrc zsh zshrc)
declare -a COPY_TO_CONFIG=(awesome)


for conffile in ${COPY_TO_HOME[*]}
do
	create_new_link $HOME $conffile .$conffile
done

for conffile in ${COPY_TO_CONFIG[*]}
do
	create_new_link $HOME/.config $conffile $conffile
done
