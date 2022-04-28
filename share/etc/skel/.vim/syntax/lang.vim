" Vim syntax file
" Language:	general language
" Maintainer:	Wu Fengguang <wfg@mail.ustc.edu.cn>
" Last Change:	2020

syn match langConstant		"\<[A-Z_]\+_[A-Z_]\+\>"
syn match langIdentifier	"\<\k\+_\k\+\>"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link langIdentifier	Identifier
hi def link langConstant	Constant
