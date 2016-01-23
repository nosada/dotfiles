#!/bin/bash

ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf
ln -s ${PWD}/vimrc ${HOME}/.vimrc
ln -s ${PWD}/vim ${HOME}/.vim
mkdir -p ${HOME}/.vim/bundle/
git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
