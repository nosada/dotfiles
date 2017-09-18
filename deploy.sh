#!/bin/bash

USER_CONF_DIR="${HOME}/.config"
USER_LOCAL_DIR="${HOME}/.local"

function check_vim_existence() { which "vim" &> /dev/null; }
function check_neovim_existence() { which "nvim" &> /dev/null; }

# deploy tmux config
[ ! -h "${HOME}/.tmux.conf" ] && ln -s "${PWD}/tmux.conf" "${HOME}/.tmux.conf"

# deploy and setup newsbeuter
[ ! -e "${USER_CONF_DIR}/newsbeuter" ] && ln -s "${PWD}/newsbeuter" "${USER_CONF_DIR}/newsbeuter"
[ ! -e "${USER_LOCAL_DIR}/share/newsbeuter" ] && mkdir -p "${HOME}/.local/share/newsbeuter"

# deploy vim config
check_vim_existence && [ ! -e "${HOME}/.vimrc" ] && ln -s "${PWD}/vim/init.vim" "${HOME}/.vimrc"
check_vim_existence && [ ! -e "${HOME}/.vim" ] && ln -s "${PWD}/vim/" "${HOME}/.vim"

# deploy neovim config
check_neovim_existence && [ ! -h "${HOME}/.config/nvim" ] && ln -s "${PWD}/vim/" "${USER_CONF_DIR}/nvim"

# deploy fish configs
FISH_DIR="${USER_CONF_DIR}/fish"
[ ! -e "${FISH_DIR}/config.fish" ] && ln -s "${PWD}/fish/config.fish" "${FISH_DIR}/config.fish"
[ ! -e "${FISH_DIR}/fishfile" ] && ln -s "${PWD}/fish/fishfile" "${FISH_DIR}/fishfile"

# return code is 1 if everything ware done correctly, but it's wrong (because worked 'correctly')
# return 0 and exit
exit 0
