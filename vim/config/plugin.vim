" vim:set ts=2 sw=2 et:

let s:dein_dir = g:base_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let s:dein_toml_dir = g:conf_dir . '/toml'
if !isdirectory(s:dein_toml_dir)
  execute '!mkdir' s:dein_toml_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:plugin      = s:dein_toml_dir . '/plugin.toml'
  let s:colorscheme = s:dein_toml_dir . '/colorscheme.toml'
  let s:coc         = s:dein_toml_dir . '/coc.toml'
  call dein#load_toml(s:plugin,      {'lazy': 0})
  call dein#load_toml(s:colorscheme, {'lazy': 0})
  call dein#load_toml(s:coc,         {'lazy': 0, 'build': 'yarn install --frozen-lockfile'})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
