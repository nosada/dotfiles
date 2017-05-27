#!/bin/bash

# deploy tmux config
if [ -h ${HOME}/.tmux.conf ]; then
	echo "${HOME}/.tmux.conf already exists."
else
	ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf
fi

# deploy and setup newsbeuter
if [ -h ${HOME}/.config/newsbeuter ]; then
	echo "${HOME}/.config/newsbeuter/ already exists."
else
	ln -s ${PWD}/newsbeuter ${HOME}/.config/newsbeuter
fi
if [ -e ${HOME}/.local/share/newsbeuter ];then
	echo "${HOME}/.local/share/newsbeuter/ already exists."
else
	mkdir -p ${HOME}/.local/share/newsbeuter
fi

# deploy vim (or neovim, if used) config
if [ -e /usr/bin/vim ]; then
	if [ -h ${HOME}/.vimrc ]; then
		echo "${HOME}/.vimrc already exists."
	else
		ln -s ${PWD}/vim/init.vim ${HOME}/.vimrc
	fi
	if [ -h ${HOME}/.vim ]; then
		echo "${HOME}/.vim/ already exists."
	else
		ln -s ${PWD}/vim/ ${HOME}/.vim
	fi
fi
if [ -e /usr/bin/nvim ]; then
	if [ -h ${HOME}/.config/nvim ]; then
		echo "${HOME}/.config/nvim already exists."
	else
		ln -s ${PWD}/vim/ ${HOME}/.config/nvim
	fi
fi
