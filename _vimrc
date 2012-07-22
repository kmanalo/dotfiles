set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
" source $VIMRUNTIME/templates.ar.vim
behave mswin

source $HOME/dotfiles/.vimrc

" for pathogen:
call pathogen#infect()
syntax on
filetype plugin indent on

