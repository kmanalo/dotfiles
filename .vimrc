set nowrap
set tabstop=4
set shiftwidth=4

"Highlights should always be off at first
set nohlsearch    

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set t_Co=256
silent! colorscheme leo
" another pleasant color
" silent! colorscheme koehler

"When comparing files with vimdiff ignore whitespace
set diffopt+=iwhite

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"Toggle switch for search highlighter
nnoremap <F3> :set hlsearch!<CR>

"Pressing F4 gives you the word count!
nnoremap <F4> Vg<c-g><c-[> <CR

" source as soon as we write the vimrc file
if has("autocmd")
  autocmd bufwritepost _vimrc source $MYVIMRC
endif

" enables ,v to edit vimrc
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

