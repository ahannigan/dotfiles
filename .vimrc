filetype plugin on
filetype indent on

" Auto read when a file is changed from outside
set autoread

syntax enable

" Auto Indent
set ai
set expandtab
set softtabstop=2
set shiftwidth=2

set showmatch

" Highlight as you type pattern
set incsearch

" Highlight search
set hlsearch

" :W sudo saves file
command W w !sudo tee % > /dev/null

" Solarized Dark
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
