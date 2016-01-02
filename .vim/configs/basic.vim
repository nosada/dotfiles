" default encoding
set encoding=utf-8
scriptencoding utf-8

" settings for interface
let g:hybrid_use_Xresources = 1
set t_Co=256
set background=dark
hi clear CursorLine
colorscheme hybrid


" settings for editing
syntax on
set cursorline
"set spelllang+=cjk
"set spell
set list
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set number
set showmatch
set smartcase
set smartindent
set smarttab
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin
set ambiwidth=double
set modeline
set ignorecase
set incsearch
set hlsearch
set nowritebackup
set nobackup
set noswapfile
set shiftround
set infercase
set hidden
set switchbuf=useopen
set wrap
set textwidth=0
set novisualbell

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus,unnamed
else
  set clipboard& clipboard+=unnamed
endif

set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
