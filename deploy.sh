#!/bin/bash

DOTFILES_DIR=`cd $(dirname $0); pwd`
USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }

function set_up_tmux() {
	[ ! -h "${HOME}/.tmux.conf" ] && ln -s "${DOTFILES_DIR}/tmux.conf" "${HOME}/.tmux.conf"
	[ ! -h "${HOME}/.tmux.conf" ] && exit 1
}

function set_up_fish_shell() {
	FISH_DIR="${USER_CONF_DIR}/fish"
	FISH_FUNCTIONS_DIR="${USER_CONF_DIR}/fish/functions"
	FISH_CONFIGS_DIR="${USER_CONF_DIR}/fish/conf.d"
	[ ! -d ${FISH_FUNCTIONS_DIR} ] && mkdir -p ${FISH_FUNCTIONS_DIR}
	[ ! -d ${FISH_CONFIGS_DIR} ] && mkdir -p ${FISH_CONFIGS_DIR}

	curl -Lo "${FISH_DIR}/functions/fisher.fish" --create-dirs https://git.io/fisher

	[ ! -h "${FISH_DIR}/config.fish" ] && ln -s "${DOTFILES_DIR}/fish/config.fish" "${FISH_DIR}/config.fish"
	[ ! -h "${FISH_DIR}/fishfile" ] && ln -s "${DOTFILES_DIR}/fish/fishfile" "${FISH_DIR}/fishfile"
	[ ! -h "${FISH_FUNCTIONS_DIR}/ls.fish" ] && ln -s "${DOTFILES_DIR}/fish/ls.fish" "${FISH_FUNCTIONS_DIR}/ls.fish"
	[ ! -h "${FISH_CONFIGS_DIR}/alias.fish" ] && ln -s "${DOTFILES_DIR}/fish/alias.fish" "${FISH_CONFIGS_DIR}/alias.fish"
	[ ! -e "${FISH_DIR}/config.fish" ] && exit 1
	[ ! -e "${FISH_DIR}/fishfile" ] && exit 1
	[ ! -e "${FISH_FUNCTIONS_DIR}/ls.fish" ] && exit 1
	[ ! -e "${FISH_CONFIGS_DIR}/alias.fish" ] && exit 1
}

function set_up_newsboat() {
	[ ! -e "${USER_CONF_DIR}/newsboat" ] && ln -s "${DOTFILES_DIR}/newsboat" "${USER_CONF_DIR}/newsboat"
	[ ! -e "${USER_LOCAL_DIR}/share/newsboat" ] && mkdir -p "${HOME}/.local/share/newsboat"
	[ ! -e "${USER_CONF_DIR}/newsboat" ] && exit 1
	[ ! -e "${USER_LOCAL_DIR}/share/newsboat" ] && exit 1
}

function set_up_aria2() {
	[ ! -e "${USER_CONF_DIR}/aria2" ] && ln -s "${DOTFILES_DIR}/aria2" "${USER_CONF_DIR}/aria2"
	[ ! -e "${USER_CONF_DIR}/aria2" ] && exit 1
}

function set_up_vim() {
	[ ! -e "${HOME}/.vimrc" ] && ln -s "${DOTFILES_DIR}/vim/init.vim" "${HOME}/.vimrc"
	[ ! -e "${HOME}/.vim" ] && ln -s "${DOTFILES_DIR}/vim/" "${HOME}/.vim"
	[ ! -e "${HOME}/.vimrc" ] && exit 1
	[ ! -e "${HOME}/.vim" ] && exit 1
}

function set_up_neovim() {
	[ ! -h "${HOME}/.config/nvim" ] && ln -s "${DOTFILES_DIR}/vim/" "${USER_CONF_DIR}/nvim"
	[ ! -h "${HOME}/.config/nvim" ] && exit 1
}

function install_user_scripts() {
	if [ ! -d "${HOME}/Scripts/" ]; then
		mkdir -p "${HOME}/Scripts"
	fi
	rsync -avu ${DOTFILES_DIR}/scripts/ ${HOME}/Scripts/
}

# call setup functions
set_up_tmux
set_up_fish_shell
set_up_newsboat
set_up_aria2
check_vim_existence && set_up_vim
check_neovim_existence && set_up_neovim
install_user_scripts

# return 0 if everything ok
exit 0
