#!/bin/bash

DOTFILES_DIR="${HOME}/.dotfiles"
USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }

# deploy tmux config
[ ! -h "${HOME}/.tmux.conf" ] && ln -s "${DOTFILES_DIR}/tmux.conf" "${HOME}/.tmux.conf"

# install fisherman (https://github.com/fisherman/fisherman)
FISH_DIR="${USER_CONF_DIR}/fish"
curl -Lo "${FISH_DIR}/functions/fisher.fish" --create-dirs https://git.io/fisher
# deploy fish configs
[ ! -h "${FISH_DIR}/config.fish" ] && ln -s "${DOTFILES_DIR}/fish/config.fish" "${FISH_DIR}/config.fish"
[ ! -h "${FISH_DIR}/fishfile" ] && ln -s "${DOTFILES_DIR}/fish/fishfile" "${FISH_DIR}/fishfile"

# deploy and setup newsbeuter
[ ! -e "${USER_CONF_DIR}/newsbeuter" ] && ln -s "${DOTFILES_DIR}/newsbeuter" "${USER_CONF_DIR}/newsbeuter"
[ ! -e "${USER_LOCAL_DIR}/share/newsbeuter" ] && mkdir -p "${HOME}/.local/share/newsbeuter"

# deploy vim config
check_vim_existence && [ ! -e "${HOME}/.vimrc" ] && ln -s "${DOTFILES_DIR}/vim/init.vim" "${HOME}/.vimrc"
check_vim_existence && [ ! -e "${HOME}/.vim" ] && ln -s "${DOTFILES_DIR}/vim/" "${HOME}/.vim"

# deploy neovim config
check_neovim_existence && [ ! -h "${HOME}/.config/nvim" ] && ln -s "${DOTFILES_DIR}/vim/" "${USER_CONF_DIR}/nvim"

# check existense of maybe-already-deployed configs
[ ! -h "${HOME}/.tmux.conf" ] && exit 1
[ ! -e "${USER_CONF_DIR}/newsbeuter" ] && exit 1
[ ! -e "${USER_LOCAL_DIR}/share/newsbeuter" ] && exit 1
check_vim_existence && [ ! -e "${HOME}/.vimrc" ] && exit 1
check_vim_existence && [ ! -e "${HOME}/.vim" ] && exit 1
check_neovim_existence && [ ! -h "${HOME}/.config/nvim" ] && exit 1
[ ! -e "${FISH_DIR}/config.fish" ] && exit 1
[ ! -e "${FISH_DIR}/fishfile" ] && exit 1

# return 0 if everything ok
exit 0
