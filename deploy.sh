#!/usr/bin/env bash

DOTFILES_DIR=$(cd "$(dirname "$0")" || exit; pwd)
USER_CONF_DIR="${HOME}/.config"

function check_existence() {
	command -v "$1" &> /dev/null
}

function set_up_tmux() {
	if ! check_existence tmux; then
		echo "tmux not exists. Skipping"
		return
	fi

	[ ! -d "${HOME}/.tmux/plugins" ] && mkdir -p "${HOME}/.tmux/plugins"
	[ ! -d "${HOME}/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	[ ! -h "${HOME}/.tmux.conf" ] && ln -s "${DOTFILES_DIR}/tmux.conf" "${HOME}/.tmux.conf"
	[ ! -h "${HOME}/.tmux.conf" ] && exit 2
}

function set_up_fish_shell() {
	if ! check_existence fish; then
		echo "Fish Shell not exists. Skipping"
		return
	fi

	FISH_DIR="${USER_CONF_DIR}/fish"

	FISH_FUNCTIONS_DIR="${FISH_DIR}/functions"
	FISH_CONFIGS_DIR="${FISH_DIR}/conf.d"
	FISH_COMPLETIONS_DIR="${FISH_DIR}/completions"
	[ ! -d "${FISH_FUNCTIONS_DIR}" ] && mkdir -p "${FISH_FUNCTIONS_DIR}"
	[ ! -d "${FISH_CONFIGS_DIR}" ] && mkdir -p "${FISH_CONFIGS_DIR}"
	[ ! -d "${FISH_COMPLETIONS_DIR}" ] && mkdir -p "${FISH_COMPLETIONS_DIR}"

	[ -e "${FISH_DIR}/config.fish" ] && rm -f "${FISH_DIR}/config.fish"
	ln -s "${DOTFILES_DIR}/fish/config.fish" "${FISH_DIR}/config.fish"

	[ -e "${FISH_DIR}/fish/fishfile" ] && rm -f "${FISH_DIR}/fish/fishfile"
	ln -s "${DOTFILES_DIR}/fish/fishfile" "${FISH_DIR}/fishfile"
	[ ! -e "${FISH_DIR}/fishfile" ] && exit 2

	curl https://git.io/fisher --create-dirs -sSLo "${FISH_FUNCTIONS_DIR}/fisher.fish"
	[ ! -e "${FISH_FUNCTIONS_DIR}/fisher.fish" ] && exit 2
	while read -r plugin; do
		fish -c "fisher install \"$plugin\""
	done < "${FISH_DIR}/fishfile"

	[ ! -h "${FISH_FUNCTIONS_DIR}/ls.fish" ] && ln -s "${DOTFILES_DIR}/fish/ls.fish" "${FISH_FUNCTIONS_DIR}/ls.fish"
	[ ! -e "${FISH_FUNCTIONS_DIR}/ls.fish" ] && exit 2
	[ ! -h "${FISH_FUNCTIONS_DIR}/fish_greeting.fish" ] && ln -s "${DOTFILES_DIR}/fish/fish_greeting.fish" "${FISH_FUNCTIONS_DIR}/fish_greeting.fish"
	[ ! -e "${FISH_FUNCTIONS_DIR}/fish_greeting.fish" ] && exit 2

	[ ! -h "${FISH_CONFIGS_DIR}/alias.fish" ] && ln -s "${DOTFILES_DIR}/fish/alias.fish" "${FISH_CONFIGS_DIR}/alias.fish"
	[ ! -e "${FISH_CONFIGS_DIR}/alias.fish" ] && exit 2

	if [ ! -h "${FISH_CONFIGS_DIR}/alias.specific.fish" ]; then
		if [[ $(uname -s) = "Linux" ]]; then
			ln -s "${DOTFILES_DIR}/fish/alias.linux.fish" "${FISH_CONFIGS_DIR}/alias.specific.fish"
		elif [[ $(uname -s) = "Darwin" ]]; then
			ln -s "${DOTFILES_DIR}/fish/alias.darwin.fish" "${FISH_CONFIGS_DIR}/alias.specific.fish"
		fi
	fi
	[ ! -e "${FISH_CONFIGS_DIR}/alias.specific.fish" ] && exit 2
}

function set_up_aria2() {
	if ! check_existence aria2c; then
		echo "aria2c not exists. Skipping"
		return
	fi
	[ ! -e "${USER_CONF_DIR}/aria2" ] && ln -s "${DOTFILES_DIR}/aria2" "${USER_CONF_DIR}/aria2"
	[ ! -e "${USER_CONF_DIR}/aria2" ] && exit 2
}

function set_up_vim() {
	if ! check_existence vim; then
		echo "Vim not exists. Skipping"
		return
	fi
	if check_existence nvim; then
		echo "Neovim exists. Skipping"
		return
	fi
	[ ! -e "${HOME}/.vimrc" ] && ln -s "${DOTFILES_DIR}/vim/init.vim" "${HOME}/.vimrc"
	[ ! -e "${HOME}/.vimrc" ] && exit 2
	[ ! -e "${HOME}/.vim" ] && ln -s "${DOTFILES_DIR}/vim/" "${HOME}/.vim"
	[ ! -e "${HOME}/.vim" ] && exit 2
}

function set_up_neovim() {
	if ! check_existence nvim; then
		echo "Neovim not exists. Skipping"
		return
	fi
	[ ! -h "${HOME}/.config/nvim" ] && ln -s "${DOTFILES_DIR}/vim/" "${USER_CONF_DIR}/nvim"
	[ ! -h "${HOME}/.config/nvim" ] && exit 2
}

function install_user_scripts() {
	if [ ! -d "${HOME}/Scripts/" ]; then
		mkdir -p "${HOME}/Scripts"
	fi
	rsync -avu "${DOTFILES_DIR}/scripts/" "${HOME}/Scripts/"
	if [[ $(uname -s) = "Linux" ]]; then
		mv -f "${HOME}/Scripts/hello.linux" "${HOME}/Scripts/hello"
		rm -f "${HOME}/Scripts/hello.darwin"
		rm -f "${HOME}/Scripts/create-and-mount-ramdisk"
	elif [[ $(uname -s) = "Darwin" ]]; then
		mv -f "${HOME}/Scripts/hello.darwin" "${HOME}/Scripts/hello"
		rm -f "${HOME}/Scripts/hello.linux"
	fi
}

# call setup functions
set_up_tmux
set_up_fish_shell
set_up_aria2
set_up_neovim
set_up_vim
install_user_scripts

exit 0
