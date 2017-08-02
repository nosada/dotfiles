" vim:set ts=2 sw=2 et:

" make vim basically better
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" submode
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" denite
nnoremap <silent> ,ub :<C-u>Denite buffer<CR>
nnoremap <silent> ,uf :<C-u>DeniteBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Denite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Denite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Denite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>DeniteBufferDir -buffer-name=files buffer file_mru file<CR>
au FileType denite nnoremap <silent> <buffer> <expr> <C-j> denite#do_action('split')
au FileType denite inoremap <silent> <buffer> <expr> <C-j> denite#do_action('split')
au FileType denite nnoremap <silent> <buffer> <expr> <C-l> denite#do_action('vsplit')
au FileType denite inoremap <silent> <buffer> <expr> <C-l> denite#do_action('vsplit')
au FileType denite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType denite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
