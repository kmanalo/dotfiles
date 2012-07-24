" Vim syntax file
" Language:	PENTRAN  (.pen files)                            
" Version:	0.0b 
" Last Change:	2012 07/23   
" Maintainer:	Kevin Manalo (kmanalo AT gmail.com) kmanalo.com                
" Usage:	Do :help pentran-syntax from Vim
" Credits:
" 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit if a syntax file is already loaded

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" au BufRead,BufNewFile *.pen setfiletype pen


if filetype = "pen"
  let b:pentran_dialect == "pen"
endif
