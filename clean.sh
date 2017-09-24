#!/bin/bash

USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }

# remove symlink of tmux config
[ -e "${HOME}/.tmux.conf" ] && rm -f ${HOME}/.tmux.conf

# remove symlink and directory for newsbeuter
[ -e "${USER_CONF_DIR}/newsbeuter" ] && rm -f ${USER_CONF_DIR}/newsbeuter
[ -e "${USER_LOCAL_DIR}/share/newsbeuter" ] && rm -rf ${USER_LOCAL_DIR}/share/newsbeuter

# remove vim symlinks
check_vim_existence && [ -e "${HOME}/.vimrc" ] && rm -f ${HOME}/.vimrc
check_vim_existence && [ -e "${HOME}/.vim" ] && rm -f ${HOME}/.vim

# remove neovim symlink
check_neovim_existence && [ -h "${HOME}/.config/nvim" ] && rm -f ${HOME}/.config/nvim

# remove fish symlinks
[ -e "${FISH_DIR}/config.fish" ] && rm -f ${FISH_DIR}/config.fish 
[ -e "${FISH_DIR}/fishfile" ] && rm -f ${FISH_DIR}/fishfile

# check existense of maybe-already-deployed configs
[ -h "${HOME}/.tmux.conf" ] && exit 1
[ -e "${USER_CONF_DIR}/newsbeuter" ] && exit 1
[ -e "${USER_LOCAL_DIR}/share/newsbeuter" ] && exit 1
check_vim_existence && [ -e "${HOME}/.vimrc" ] && exit 1
check_vim_existence && [ -e "${HOME}/.vim" ] && exit 1
check_neovim_existence && [ -h "${HOME}/.config/nvim" ] && exit 1
[ -e "${FISH_DIR}/config.fish" ] && exit 1
[ -e "${FISH_DIR}/fishfile" ] && exit 1

# return 0 if everything ok
exit 0
