"---------"
" General "
"---------"
set history=500

filetype plugin on
filetype indent on

" Lower the timeout when escaping visual mode
set ttimeoutlen=100

" Don't bother with backing up files
set nobackup nowb noswapfile

"-----------"
" UI Config "
"-----------"
set number relativenumber ruler
set scrolloff=8
set nowrap

set wildmenu

" Search settings
set ignorecase smartcase
set nohlsearch incsearch
set magic

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells novisualbell
set t_vb=
set tm=500

let g:netrw_banner=0

"--------------------"
" Tabs and Indenting "
"--------------------"
" 1 tab == 4 spaces
set shiftwidth=4 softtabstop=4 tabstop=4
set smarttab expandtab
set autoindent smartindent

"----------------"
" Key Remappings "
"----------------"
let mapleader = " "

noremap gh ^
noremap gl $
noremap gm %
nnoremap <leader>ft :Ex<CR>
nnoremap Q <nop>
xnoremap <leader>p "_dP
" Yank to the system clipboard. This will only work if xterm_clipboard is
" enabled. Run `:version` to check if this feature is enabled.
noremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>z :bufdo e!<CR>
