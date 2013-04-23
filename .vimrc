
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

"pathogen support
"call pathogen#helptags()
source ~/dotfiles/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('~/dotfiles/bundle')
call pathogen#runtime_append_all_bundles('~/dotfiles/bundle')
syntax on
filetype plugin indent on

"fortran boolean to ensure free format
let fortran_free_source=1
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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

" delete trailing whitespace
nnoremap <silent> <leader><del> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" remove trailing whitespace before join, command is ",J"
nnoremap <silent> <leader>J :let _s=@/<Bar>:s/\s\+$//e<Bar>:j<CR>:let @/=_s<Bar>:nohl<CR>

" vim-latexsuite settings 
"
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
