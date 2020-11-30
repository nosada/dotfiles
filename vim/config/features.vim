" vim:set ts=2 sw=2 et:

" Pathogen load
filetype on
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" miniyank settings
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
