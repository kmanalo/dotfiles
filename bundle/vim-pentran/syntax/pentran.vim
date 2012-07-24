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

let b:pentran_dialect == "pen"

syn match pentranType		"\<character\>"
syn match pentranType		"\<complex\>"
syn match pentranType		"\<integer\>"
syn keyword pentranType		intrinsic
syn match pentranType		"\<implicit\>"
syn keyword pentranStructure	dimension
syn keyword pentranStorageClass	parameter save
syn match pentranUnitHeader	"\<subroutine\>"
syn keyword pentranCall		call
syn match pentranUnitHeader	"\<function\>"
syn match pentranUnitHeader	"\<program\>"
syn keyword pentranKeyword	return stop
syn keyword pentranConditional	else then
syn match pentranConditional	"\<if\>"
syn match pentranRepeat		"\<do\>"

" Integers
syn match pentranNumber	display "\<\d\+\(_\a\w*\)\=\>"
" floating point number, without a decimal point
syn match pentranFloatNoDec	display	"\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
" floating point number, starting with a decimal point
syn match pentranFloatIniDec	display	"\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" floating point number, no digits after decimal
syn match pentranFloatEndDec	display	"\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" floating point number, D or Q exponents
syn match pentranFloatDExp	display	"\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" floating point number
syn match pentranFloat	display	"\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" Numbers in formats
syn match pentranFormatSpec	display	"\d*f\d\+\.\d\+"
syn match pentranFormatSpec	display	"\d*e[sn]\=\d\+\.\d\+\(e\d+\>\)\="
syn match pentranFormatSpec	display	"\d*\(d\|q\|g\)\d\+\.\d\+\(e\d+\)\="
syn match pentranFormatSpec	display	"\d\+x\>"

syn region pentranString	start=+"+ end=+"+	contains=pentranLeftMargin,pentranContinueMark,pentranSerialNumber

syn match  pentranUnitHeader	"\<end\s*function"
syn match  pentranUnitHeader	"\<end\s*interface"
syn match  pentranUnitHeader	"\<end\s*module"
syn match  pentranUnitHeader	"\<end\s*program"
syn match  pentranUnitHeader	"\<end\s*subroutine"

syn cluster pentranCommentGroup contains=pentranTodo

syn match pentranComment		excludenl "^[!c*].*$" contains=@pentranCommentGroup
command -nargs=+ HiLink hi def link <args>

  " The default highlighting differs for each dialect.
  " Transparent groups:
  " pentranParen, pentranLeftMargin
  " pentranProgram, pentranModule, pentranSubroutine, pentranFunction,
  " pentranBlockData
  " pentran77Loop, pentran90Loop, pentranIfBlock, pentranCase
  " pentranMultiCommentLines
  HiLink pentranKeyword 	Keyword
  HiLink pentranConstructName	Identifier
  HiLink pentranConditional	Conditional
  HiLink pentranRepeat		Repeat
  HiLink pentranTodo		Todo
  HiLink pentranContinueMark	Todo
  HiLink pentranString		String
  HiLink pentranNumber		Number
  HiLink pentranOperator	Operator
  HiLink pentranBoolean		Boolean
  HiLink pentranLabelError	Error
  HiLink pentranObsolete	Todo
  HiLink pentranType		Type
  HiLink pentranStructure	Type
  HiLink pentranStorageClass	StorageClass
  HiLink pentranCall		pentranUnitHeader
  HiLink pentranUnitHeader	pentranPreCondit
  HiLink pentranReadWrite	Keyword
  HiLink pentranIO		Keyword
  HiLink pentran95Intrinsic	pentran90Intrinsic
  HiLink pentran77Intrinsic	pentran90Intrinsic
  HiLink pentran90Intrinsic	Function

  HiLink pentranFloat		Float
  HiLink pentranPreCondit	PreCondit
  HiLink pentranInclude		Include
  HiLink cIncluded		pentranString
  HiLink pentranComment		Comment
  HiLink pentranSerialNumber	Todo
  HiLink pentranTab		Error

let b:current_syntax = "pentran"

" vim: ts=8 tw=132
