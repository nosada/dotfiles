#!/bin/bash

USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }

function remove_tmux_config() {
	rm -f ${HOME}/.tmux.conf
	[ -h "${HOME}/.tmux.conf" ] && exit 1
}

function remove_newsboat_config() {
	rm -f ${USER_CONF_DIR}/newsboat
	rm -rf ${USER_LOCAL_DIR}/share/newsboat
	[ -e "${USER_CONF_DIR}/newsboat" ] && exit 1
	[ -e "${USER_LOCAL_DIR}/share/newsboat" ] && exit 1
}

function remove_aria2_config() {
	rm -f ${USER_CONF_DIR}/aria2
	[ -e "${USER_CONF_DIR}/aria2" ] && exit 1
}

function remove_vim_config() {
	rm -f ${HOME}/.vimrc
	rm -f ${HOME}/.vim
	[ -e "${HOME}/.vimrc" ] && exit 1
	[ -e "${HOME}/.vim" ] && exit 1
}

function remove_neovim_config() {
	rm -f ${HOME}/.config/nvim
	[ -h "${HOME}/.config/nvim" ] && exit 1
}

function remove_fish_shell_config () {
	FISH_DIR="${USER_CONF_DIR}/fish"
	rm -f ${FISH_DIR}/config.fish
	rm -f ${FISH_DIR}/fishfile
	[ -e "${FISH_DIR}/config.fish" ] && exit 1
	[ -e "${FISH_DIR}/fishfile" ] && exit 1
}

# call cleaning functions
remove_tmux_config
remove_fish_shell_config
remove_newsboat_config
remove_aria2_config
check_vim_existence && remove_vim_config
check_neovim_existence && remove_neovim_config

# return 0 if everything ok
exit 0
