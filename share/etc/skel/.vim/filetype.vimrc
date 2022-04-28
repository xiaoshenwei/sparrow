
filetype on           " Enable fieltype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on             " Enable syntax highlighting


if has("autocmd")

" Set some sensible defaults for editing C-files
augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  " autocmd BufRead *       		set formatoptions=tcql nocindent comments&
  autocmd BufRead *.cpp,*.cc,*.hpp setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufRead *.c,*.h setlocal formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
  autocmd BufRead *.c,*.h setlocal noignorecase noexpandtab ts=8 shiftwidth=8
augroup END

augroup scripts
  autocmd BufRead ruby,crystal,python,perl,*.rb,*.cr,*.py,*.pl set noignorecase
  autocmd FileType ruby,crystal setlocal expandtab shiftwidth=2 tabstop=2
augroup END

augroup mail
  autocmd BufNewFile,BufRead mail,mutt* set expandtab tw=70 sts=8 ts=8 shiftwidth=8
  autocmd BufNewFile,BufRead mail,mutt* set fileencoding=utf-8
"if strftime("%H") > 6 && strftime("%H") < 20
  "autocmd BufNewFile,BufRead mail,mutt* set background=light
"else
  "autocmd BufNewFile,BufRead mail,mutt* set background=dark
"endif
" autocmd BufNewFile,BufRead mail,mutt* colo solarized
" autocmd BufNewFile,BufRead mail,mutt* colo candycode
" autocmd BufNewFile,BufRead mail,mutt* colo autumn
  autocmd BufNewFile,BufRead mail,mutt* hi SpellBad     cterm=undercurl	gui=undercurl guisp=red
  "autocmd BufNewFile,BufRead mail,mutt* setlocal spell spelllang=en_us
augroup END

augroup tex
  " autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us
augroup END


augroup patch
  " autocmd BufNewFile,BufRead *.patch	setlocal filetype=patch
  autocmd BufNewFile,BufRead *.patch 	setlocal filetype=diff nospell
  autocmd BufNewFile,BufRead gitcommit,gitsendemail,diff,*.patch	colo koehler|hi diffFile guibg=tomato
  autocmd BufNewFile,BufRead gitcommit,COMMIT_EDITMSG,diff,*.patch	setlocal textwidth=72 spell
  " autocmd FileType		diff	if &diff == 0 | colo koehler | endif
augroup END

augroup stdin
	autocmd StdinReadPost * setlocal buftype=nofile bufhidden=hide noswapfile
augroup END

endif " has ("autocmd")

