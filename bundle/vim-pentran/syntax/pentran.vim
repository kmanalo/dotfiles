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

filetype plugin on

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match penComment "\/.*$"
syn match penComment "^\-.*$"

syn keyword penBlockICmd ngeom modadj ngroup isn nmatl ixcrs jycrs
syn keyword penBlockICmd kzcrs lodbal timcut tolmgd decmpv

syn keyword penBlockIICmd xmesh ixfine ixmed ymesh jyfine jymed
syn keyword penBlockIICmd zmesh kzfine kzmed nmattp flxini mathmg

syn keyword penBlockIIICmd lib legord nxtyp ihm iht ihng chig   
syn keyword penBlockIIICmd nxcmnt legoxs ihs

syn keyword penBlockIVCmd ncoupl nprtyp nrdblk tolin tolout
syn keyword penBlockIVCmd dtwmxw maxitr methit ndmeth nzonrb methac

syn keyword penBlockVCmd nscmsh nsdef sref serg smag omegap spacpf

syn keyword penBlockVICmd ibback ibfrnt jbeast jbwest kbsout kbnort

syn keyword penBlockVIICmd nxspr nmatpr ngeopr nsrcpr nsumpr 
syn keyword penBlockVIICmd meshpr nfdump nsdump njdump nadump 

syn keyword penOperator T
syn match penOperator "="

let b:current_syntax = "pentran"

hi def link penComment   Comment
hi def link penBlockICmd Statement
hi def link penBlockIICmd Statement
hi def link penBlockIIICmd Statement
hi def link penBlockIVCmd Statement
hi def link penBlockVCmd Statement
hi def link penBlockVICmd Statement
hi def link penBlockVIICmd Statement
hi def link penOperator Operator

