#!/bin/bash

USER_CONF_DIR="${HOME}/.config"

function remove_tmux_config() {
	rm -f "${HOME}/.tmux.conf"
	rm -rf "${HOME}/.tmux"
	[ -h "${HOME}/.tmux.conf" ] && exit 17
}

function remove_aria2_config() {
	rm -f "${USER_CONF_DIR}/aria2"
	[ -e "${USER_CONF_DIR}/aria2" ] && exit 17
}

function remove_vim_config() {
	rm -f "${HOME}/.vimrc"
	[ -e "${HOME}/.vimrc" ] && exit 17
	rm -f "${HOME}/.vim"
	[ -e "${HOME}/.vim" ] && exit 17
}

function remove_neovim_config() {
	rm -f "${HOME}/.config/nvim"
	[ -h "${HOME}/.config/nvim" ] && exit 17
}

function remove_fish_shell_config () {
	FISH_DIR="${USER_CONF_DIR}/fish"
	FISH_FUNCTIONS_DIR="${USER_CONF_DIR}/fish/functions"
	FISH_CONFIGS_DIR="${USER_CONF_DIR}/fish/conf.d"

	rm -f "${FISH_DIR}/config.fish"
	[ -e "${FISH_DIR}/config.fish" ] && exit 17
	rm -f "${FISH_DIR}/fishfile"
	[ -e "${FISH_DIR}/fishfile" ] && exit 17

	rm -f "${FISH_FUNCTIONS_DIR}/fisher.fish"
	[ -e "${FISH_FUNCTIONS_DIR}/fisher.fish" ] && exit 17
	rm -f "${FISH_FUNCTIONS_DIR}/ls.fish"
	[ -e "${FISH_FUNCTIONS_DIR}/ls.fish" ] && exit 17
	rm -f "${FISH_FUNCTIONS_DIR}/fish_greeting.fish"
	[ -e "${FISH_FUNCTIONS_DIR}/fish_greeting.fish" ] && exit 17

	rm -f "${FISH_CONFIGS_DIR}/alias.fish"
	[ -e "${FISH_CONFIGS_DIR}/alias.fish" ] && exit 17
	rm -f "${FISH_CONFIGS_DIR}/alias.specific.fish"
	[ -e "${FISH_CONFIGS_DIR}/alias.specific.fish" ] && exit 17
}

# call cleaning functions
remove_tmux_config
remove_fish_shell_config
remove_aria2_config
remove_vim_config
remove_neovim_config
