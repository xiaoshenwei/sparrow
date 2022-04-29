" Vim syntax file
" Language:	Patch (context or unified)
" Maintainer:	Wu Fengguang <wfg@mail.ustc.edu.cn>
" Last Change:	2020

syn match patchHeader	"^Subject: .*"
syn match patchHeader	"^From: .*"
syn match patchHeader	"^Signed-off-by: .*"

syn match patchCredit	"^Reviewed-by: .*"
syn match patchCredit	"^Acked-by: .*"
syn match patchCredit	"^Reported-by: .*"
syn match patchCredit	"^Tested-by: .*"

syn match patchItem	"^\s*- .*"	contains=langIdentifier,langConstant
syn match patchItem	"^\s*\* .*"	contains=langIdentifier,langConstant
syn match patchItem	"^\s*\o .*"	contains=langIdentifier,langConstant
syn match patchItem	"^\s*\d)\? .*"	contains=langIdentifier,langConstant


" 1st level mail reply

syn match patchHeader	"^>Subject: .*"
syn match patchHeader	"^>From: .*"
syn match patchHeader	"^>Signed-off-by: .*"

syn match patchCredit	"^>Reviewed-by: .*"
syn match patchCredit	"^>Acked-by: .*"
syn match patchCredit	"^>Reported-by: .*"
syn match patchCredit	"^>Tested-by: .*"

syn match patchItem	"^>\s*- .*" 	contains=langIdentifier,langConstant
syn match patchItem	"^>\s*\* .*"	contains=langIdentifier,langConstant
syn match patchItem	"^>\s*\o .*"	contains=langIdentifier,langConstant
syn match patchItem	"^>\s*\d)\? .*" contains=langIdentifier,langConstant

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link patchItem		Directory
hi def link patchHeader		Statement
hi def link patchCredit		Label
