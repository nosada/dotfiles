" vim:set ts=2 sw=2 et:

" Pathogen load
filetype on
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" pymode setting
let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

" syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" deoplete setting
if has('nvim') && has('python3')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:deoplete#auto_complete_start_length = 1
  let g:deoplete#enable_camel_case = 0
  let g:deoplete#enable_ignore_case = 0
  let g:deoplete#enable_refresh_always = 0
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#file#enable_buffer_path = 1
  let g:deoplete#max_list = 10000
endif

" unite setting
let g:unite_enable_start_insert=0
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

au BufRead,BufNewFile *.yml set filetype=yaml.ansible
au BufRead,BufNewFile *.yaml set filetype=yaml.ansible
