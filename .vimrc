
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

"pathogen support
source ~/dotfiles/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('~/dotfiles/bundle')
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype off
syntax on
filetype plugin indent on

"fortran boolean to ensure free format
let fortran_free_source=1
set nowrap
set tabstop=4
set shiftwidth=4

"Highlights should always be off at first
set nohlsearch    

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set t_Co=256
" another pleasant color in gvim
silent! colorscheme koehler
silent! colorscheme darkblue
" otherwise use this one in linux
if has("unix")
  silent! colorscheme leo
endif

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
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" enables ,v to edit vimrc
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

