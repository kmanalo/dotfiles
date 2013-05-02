
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

" pathogen support
source ~/dotfiles/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('~/dotfiles/bundle')
call pathogen#runtime_append_all_bundles('~/dotfiles/bundle')
call pathogen#helptags()
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

" toggle switch for search highlighter
nnoremap <F3> :set hlsearch!<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set t_Co=256
" another pleasant color in gvim
" silent! colorscheme koehler
silent! colorscheme darkblue
" otherwise use this one in linux
if has("unix")
  silent! colorscheme leo
endif

"When comparing files with vimdiff ignore whitespace
set diffopt+=iwhite

" a better way to move between buffers!
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" pressing F4 gives you the word count!
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
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" end section: vim-latexsuite settings

" mappings for ,_ to split horizontal
map <leader>_ <C-w>s
" mappings for ,| to split vertical
map <leader><bar> <C-w>v

" map to move between windows
map <leader>k <C-w><Up>
map <leader>j <C-w><Down>
map <leader>h <C-w><Left>
map <leader>l <C-w><Right> 

" support indents for tex files
let g:tex_indent_items = 1

" set 80 column width for all files
set tw=80

function! WordCount()
    let s:old_status = v:statusmsg
    let position = getpos(".")
    exe ":silent normal g\"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
        let s:word_count = str2nr(split(v:statusmsg)[11])
        let v:statusmsg = s:old_status
    end
    call setpos('.', position)
    return s:word_count 
endfunction

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
"
" formats the statusline
set statusline=%f                               "file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Words:%{WordCount()}
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
" set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

set laststatus=2 " always keep the statusline active

