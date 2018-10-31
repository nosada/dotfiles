#!/bin/bash

DOTFILES_DIR=`cd $(dirname $0); pwd`
USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }
function exit-with-enoent() { ERRNO=2; exit ${ERRNO}; }

function set_up_tmux() {
	[ ! -d "${HOME}/.tmux/plugins" ] && mkdir -p ${HOME}/.tmux/plugins
	[ ! -d "${HOME}/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	[ ! -h "${HOME}/.tmux.conf" ] && ln -s "${DOTFILES_DIR}/tmux.conf" "${HOME}/.tmux.conf"
	[ ! -h "${HOME}/.tmux.conf" ] && exit-with-enoent
}

function set_up_fish_shell() {
	FISH_DIR="${USER_CONF_DIR}/fish"
	FISH_FUNCTIONS_DIR="${USER_CONF_DIR}/fish/functions"
	FISH_CONFIGS_DIR="${USER_CONF_DIR}/fish/conf.d"
	FISH_COMPLETIONS_DIR="${USER_CONF_DIR}/fish/completions"
	[ ! -d ${FISH_FUNCTIONS_DIR} ] && mkdir -p ${FISH_FUNCTIONS_DIR}
	[ ! -d ${FISH_CONFIGS_DIR} ] && mkdir -p ${FISH_CONFIGS_DIR}
	[ ! -d ${FISH_COMPLETIONS_DIR} ] && mkdir -p ${FISH_COMPLETIONS_DIR}

	[ ! -h "${FISH_DIR}/config.fish" ] && ln -s "${DOTFILES_DIR}/fish/config.fish" "${FISH_DIR}/config.fish"
	[ ! -e "${FISH_DIR}/config.fish" ] && exit-with-enoent
	[ ! -e "${FISH_DIR}/fishfile" ] && cp "${DOTFILES_DIR}/fish/fishfile" "${FISH_DIR}/fishfile"
	[ ! -e "${FISH_DIR}/fishfile" ] && exit-with-enoent

	curl https://git.io/fisher --create-dirs -sSLo $FISH_FUNCTIONS_DIR/fisher.fish
	[ ! -e "${FISH_FUNCTIONS_DIR}/fisher.fish" ] && exit-with-enoent
	[ ! -h "${FISH_FUNCTIONS_DIR}/ls.fish" ] && ln -s "${DOTFILES_DIR}/fish/ls.fish" "${FISH_FUNCTIONS_DIR}/ls.fish"
	[ ! -e "${FISH_FUNCTIONS_DIR}/ls.fish" ] && exit-with-enoent

	[ ! -h "${FISH_CONFIGS_DIR}/alias.fish" ] && ln -s "${DOTFILES_DIR}/fish/alias.fish" "${FISH_CONFIGS_DIR}/alias.fish"
	[ ! -e "${FISH_CONFIGS_DIR}/alias.fish" ] && exit-with-enoent
}

function set_up_aria2() {
	[ ! -e "${USER_CONF_DIR}/aria2" ] && ln -s "${DOTFILES_DIR}/aria2" "${USER_CONF_DIR}/aria2"
	[ ! -e "${USER_CONF_DIR}/aria2" ] && exit-with-enoent
}

function set_up_vim() {
	[ ! -e "${HOME}/.vimrc" ] && ln -s "${DOTFILES_DIR}/vim/init.vim" "${HOME}/.vimrc"
	[ ! -e "${HOME}/.vimrc" ] && exit-with-enoent
	[ ! -e "${HOME}/.vim" ] && ln -s "${DOTFILES_DIR}/vim/" "${HOME}/.vim"
	[ ! -e "${HOME}/.vim" ] && exit-with-enoent
}

function set_up_neovim() {
	[ ! -h "${HOME}/.config/nvim" ] && ln -s "${DOTFILES_DIR}/vim/" "${USER_CONF_DIR}/nvim"
	[ ! -h "${HOME}/.config/nvim" ] && exit-with-enoent
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
set_up_aria2
check_vim_existence && set_up_vim
check_neovim_existence && set_up_neovim
install_user_scripts

# return 0 if everything ok
exit 0
