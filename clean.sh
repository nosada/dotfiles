#!/bin/bash

USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }
function exit-with-eexist() { ERRNO=17; exit ${ERRNO}; }

function remove_tmux_config() {
	rm -f ${HOME}/.tmux.conf
	[ -h "${HOME}/.tmux.conf" ] && exit-with-eexist
}

function remove_aria2_config() {
	rm -f ${USER_CONF_DIR}/aria2
	[ -e "${USER_CONF_DIR}/aria2" ] && exit-with-eexist
}

function remove_vim_config() {
	rm -f ${HOME}/.vimrc
	[ -e "${HOME}/.vimrc" ] && exit-with-eexist
	rm -f ${HOME}/.vim
	[ -e "${HOME}/.vim" ] && exit-with-eexist
}

function remove_neovim_config() {
	rm -f ${HOME}/.config/nvim
	[ -h "${HOME}/.config/nvim" ] && exit-with-eexist
}

function remove_fish_shell_config () {
	FISH_DIR="${USER_CONF_DIR}/fish"
	FISH_FUNCTIONS_DIR="${USER_CONF_DIR}/fish/functions"
	FISH_CONFIGS_DIR="${USER_CONF_DIR}/fish/conf.d"
	FISH_COMPLETIONS_DIR="${USER_CONF_DIR}/fish/completions"

	rm -f "${FISH_DIR}/config.fish"
	[ -e "${FISH_DIR}/config.fish" ] && exit-with-eexist
	rm -f "${FISH_DIR}/fishfile"
	[ -e "${FISH_DIR}/fishfile" ] && exit-with-eexist

	rm -f "${FISH_FUNCTIONS_DIR}/fisher.fish"
	[ -e "${FISH_FUNCTIONS_DIR}/fisher.fish" ] && exit-with-eexist
	rm -f "${FISH_FUNCTIONS_DIR}/ls.fish"
	[ -e "${FISH_FUNCTIONS_DIR}/ls.fish" ] && exit-with-eexist

	rm -f "${FISH_CONFIGS_DIR}/alias.fish"
	[ -e "${FISH_CONFIGS_DIR}/alias.fish" ] && exit-with-eexist
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
