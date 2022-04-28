" https://coderwall.com/p/if9mda
" Automatically set paste mode in Vim when pasting in insert mode 
"
" This will break pasting in tmux command promt

" function! WrapForTmux(s)
"   if !exists('$TMUX') || system('tmux -V')[5] >= '2'
"     return a:s
"   endif
" 
"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"
" 
"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction

" if exists('$TMUX')
" 	let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" 	let &t_EI .= WrapForTmux("\<Esc>[?2004l")
" elseif &term == "screen" || &term == "screen-bce"
" 	let &t_SI .= "\eP\e[?2004h\e\\"
" 	let &t_EI .= "\eP\e[?2004l\e\\"
" endif

" " this caused problem _outside_ vim
" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction
" 
" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" https://github.com/ConradIrwin/vim-bracketed-paste/blob/master/plugin/bracketed-paste.vim

" Code from:
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
" then https://coderwall.com/p/if9mda
" and then https://github.com/aaronjensen/vimfiles/blob/59a7019b1f2d08c70c28a41ef4e2612470ea0549/plugin/terminaltweaks.vim
" to fix the escape time problem with insert mode.
"
" Docs on bracketed paste mode:
" http://www.xfree86.org/current/ctlseqs.html
" Docs on mapping fast escape codes in vim
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim

function! XTermPasteBegin(ret)
  " set pastetoggle=<Esc>[201~
  " if a:ret == "i"
	  " inoremap <f29> <f29><ESC>
  " else
	  " inoremap <f29> <f29>
  " endif
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

let &t_ti .= "\<Esc>[?2004h"
let &t_te .= "\<Esc>[?2004l"

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map      <expr> <f28> XTermPasteBegin("i")
" nnoremap <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
" cnoremap <expr> <f28> XTermPasteBegin("i")
" inoremap <expr> <f28> XTermPasteBegin("")
cmap <f28> <nop>
cmap <f29> <nop>
