#!/bin/bash

USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }

# remove symlink of tmux config
rm -f ${HOME}/.tmux.conf

# remove symlink and directory for newsboat
rm -f ${USER_CONF_DIR}/newsboat
rm -rf ${USER_LOCAL_DIR}/share/newsboat

# remove vim symlinks
check_vim_existence && rm -f ${HOME}/.vimrc
check_vim_existence && rm -f ${HOME}/.vim

# remove neovim symlink
check_neovim_existence && rm -f ${HOME}/.config/nvim

# remove fish symlinks
FISH_DIR="${USER_CONF_DIR}/fish"
rm -f ${FISH_DIR}/config.fish
rm -f ${FISH_DIR}/fishfile

# check existense of maybe-already-deployed configs
[ -h "${HOME}/.tmux.conf" ] && exit 1
[ -e "${USER_CONF_DIR}/newsboat" ] && exit 1
[ -e "${USER_LOCAL_DIR}/share/newsboat" ] && exit 1
check_vim_existence && [ -e "${HOME}/.vimrc" ] && exit 1
check_vim_existence && [ -e "${HOME}/.vim" ] && exit 1
check_neovim_existence && [ -h "${HOME}/.config/nvim" ] && exit 1
[ -e "${FISH_DIR}/config.fish" ] && exit 1
[ -e "${FISH_DIR}/fishfile" ] && exit 1

# return 0 if everything ok
exit 0
