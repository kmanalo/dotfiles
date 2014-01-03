" this is assumed to be the home of the mighty vimrc for any system
" so clone it with 'git clone git@github.com:kmanalo/dotfiles.git
" SETTINGS @ $HOME/dotfiles/bundle/vim-custom/plugin
let $MYVIMRC=$HOME."/dotfiles/.vimrc"

" Vundle Requires:
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'nvie/vim-flake8'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

" pathogen support
source $HOME/dotfiles/bundle/vim-pathogen/autoload/pathogen.vim
" sometimes you need to see all the paths, uncomment next line to show
" verbose set runtimepath?
call pathogen#infect('$HOME/dotfiles/bundle')
call pathogen#runtime_append_all_bundles('$HOME/dotfiles/bundle')
call pathogen#helptags()
syntax on
filetype plugin indent on

