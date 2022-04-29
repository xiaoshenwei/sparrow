" Vim syntax file
" Language:	Diff (context or unified)
" Maintainer:	Bram Moolenaar <Bram@vim.org>
"               Translations by Jakson Alves de Aquino.
" Last Change:	2016 Apr 02

scriptencoding utf-8

source ~/.vim/syntax/patch.vim

syn match diffOnly	"^Only in .*"
syn match diffIdentical	"^Files .* and .* are identical$"
syn match diffDiffer	"^Files .* and .* differ$"
syn match diffBDiffer	"^Binary files .* and .* differ$"
syn match diffIsA	"^File .* is a .* while file .* is a .*"
syn match diffNoEOL	"^\\ No newline at end of file .*"
syn match diffCommon	"^Common subdirectories: .*"

syn match diffOnly	"^>Only in .*"
syn match diffIdentical	"^>Files .* and .* are identical$"
syn match diffDiffer	"^>Files .* and .* differ$"
syn match diffBDiffer	"^>Binary files .* and .* differ$"
syn match diffIsA	"^>File .* is a .* while file .* is a .*"
syn match diffNoEOL	"^>\\ No newline at end of file .*"
syn match diffCommon	"^>Common subdirectories: .*"

"syn match diffRemoved	"^-.*" "contains=langIdentifier,langConstant
syn match diffRemoved	"^<.*"
syn match diffAdded	"^+.*" "contains=langIdentifier,langConstant
"syn match diffAdded	"^>.*"
syn match diffChanged	"^! .*"

syn match diffRemoved	"^>-.*" " contains=langIdentifier,langConstant
syn match diffRemoved	"^><.*"
syn match diffAdded	"^>+.*" " contains=langIdentifier,langConstant
"syn match diffAdded	"^>>.*"
syn match diffChanged	"^>! .*"

syn match diffSubname	" @@..*"ms=s+3 contained
syn match diffLine	"^@.*" contains=diffSubname
syn match diffLine	"^\<\d\+\>.*"
syn match diffLine	"^\*\*\*\*.*"
syn match diffLine	"^---$"

syn match diffSubname	"> @@..*"ms=s+3 contained
syn match diffLine	">^@.*" contains=diffSubname
syn match diffLine	">^\<\d\+\>.*"
syn match diffLine	">^\*\*\*\*.*"
syn match diffLine	">^---$"

" Some versions of diff have lines like "#c#" and "#d#" (where # is a number)
syn match diffLine	"^\d\+\(,\d\+\)\=[cda]\d\+\>.*"
syn match diffLine	"^>\d\+\(,\d\+\)\=[cda]\d\+\>.*"

syn match diffFile	"^diff\>.*"
syn match diffFile	"^+++ .*"
syn match diffFile	"^Index: .*"
syn match diffFile	"^==== .*"
syn match diffOldFile	"^\*\*\* .*"
syn match diffNewFile	"^--- .*"

syn match diffFile	"^>diff\>.*"
syn match diffFile	"^>+++ .*"
syn match diffFile	"^>Index: .*"
syn match diffFile	"^>==== .*"
syn match diffOldFile	"^>\*\*\* .*"
syn match diffNewFile	"^>--- .*"

" Used by git
syn match diffIndexLine	"^index \x\x\x\x.*"
syn match diffIndexLine	"^>index \x\x\x\x.*"

syn match diffComment	"^#.*"
syn match diffComment	"^>#.*"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link diffOldFile		diffFile
hi def link diffNewFile		diffFile
hi def link diffIndexLine	PreProc
hi def link diffFile		Function
hi def link diffOnly		Constant
hi def link diffIdentical	Constant
hi def link diffDiffer		Constant
hi def link diffBDiffer		Constant
hi def link diffIsA		Constant
hi def link diffNoEOL		Constant
hi def link diffCommon		DiffText
hi def link diffRemoved		DiffDelete
hi def link diffChanged		DiffChange
hi def link diffAdded		DiffAdd
hi def link diffLine		Character
hi def link diffSubname		PreProc
hi def link diffComment		Define

" vim: ts=8 sw=2
