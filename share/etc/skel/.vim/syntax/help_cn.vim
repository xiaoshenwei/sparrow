" Vim syntax extention file for Chinese help
scriptencoding euc-cn
" Language:	Vim help file
" Maintainer:	lang2 (http://vimcdoc.sf.net)
" Last Change:	2005 March
" Usage: copy this file to $VIMRUNTIME/syntax


syn match helpVimCn		"VIM �ο��ֲ�.*"
syn match helpVimCn		"VIM �û��ֲ�.*"
syn keyword helpNoteCn		ע�� ��ע
syn keyword helpYizheCn		���� ���ߣ�
"syn region helpNotVi		start="{Vi[: ]" start="{û��" start="{��" end="}" contains=helpLeadBlank,helpHyperTextJump


hi link helpVimCn		Identifier
hi link helpNoteCn		Todo
hi link helpNotViCn		Special
hi link helpYizheCn		Identifier

" vim: ts=8 sw=2
