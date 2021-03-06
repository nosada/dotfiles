" vim:set ts=2 sw=2 et:

if has('nvim')
  let s:config_path = '~/.config/nvim'
else
  let s:config_path = '~/.vim'
endif

let g:base_dir = expand(s:config_path)
let g:conf_dir = g:base_dir . '/config'
execute 'set runtimepath^=' . fnamemodify(g:conf_dir, ':p')

runtime! config/plugin.vim
runtime! config/base.vim
runtime! config/keymap.vim
runtime! config/features.vim
