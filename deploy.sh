#!/bin/bash

if [ -h ${HOME}/.tmux.conf ]; then
	echo "${HOME}/.tmux.conf already exists."
else
	ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf
fi

if [ -h ${HOME}/.vimrc ]; then
	echo "${HOME}/.vimrc already exists."
else
	ln -s ${PWD}/vimrc ${HOME}/.vimrc
fi

if [ -h ${HOME}/.vim ]; then
	echo "${HOME}/.vim/ already exists."
else
	ln -s ${PWD}/vim ${HOME}/.vim
fi

if [ -d ${HOME}/.vim/bundle ]; then
	echo "${HOME}/.vim/bundle/ already exists."
else
	mkdir -p ${HOME}/.vim/bundle/
	git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
fi
