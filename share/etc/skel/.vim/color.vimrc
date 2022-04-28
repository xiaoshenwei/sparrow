" vim color scheme previews
" http://www-2.cs.cmu.edu/~maverick/VimColorSchemeTest/index-C.html

" echo &filetype
" echo "filetype"

if strftime("%H") > 7 && strftime("%H") < 18
	set background=light
	set background=dark
else
	set background=dark
endif

if &diff && ($COLORTERM =~ "rxvt" || exists('$TMUX'))
	"set t_Co=256
	colo summerfruit256
elseif has('termguicolors') && filereadable(expand("$HOME/.vim/colors/solarized.vim"))
	set termguicolors
	set t_8f=[38;2;%lu;%lu;%lum
	set t_8b=[48;2;%lu;%lu;%lum
	" set background=light
	" colo two2tango
	" moria dusk molokai sonoma
	" gruvbox
	" colo two2tango
	" vividchalk
	" moria
	" fnaqevan
	" freya
	" zmrok
	" zenburn
	" colo molokai
	" colo solarized
	colo tango
else
	try
		" colo fnaqevan
		colo koehler
	catch /^Vim\%((\a\+)\)\=:E185/
		colo industry
	endtry
endif

hi Statement cterm=bold
hi Conditional cterm=bold
hi Repeat cterm=bold
" hi Normal guibg=#000000
" hi NonText guibg=#000000

highlight StatusLine   term=bold cterm=bold ctermfg=yellow ctermbg=blue   guifg=#d86020 guibg=#005c70 gui=bold
highlight StatusLineNC term=none cterm=none ctermfg=black  ctermbg=yellow guifg=#d86020 guibg=#005c70 gui=bold
" highlight SpellBad     cterm=underline,italic,bold gui=undercurl guisp=red
" highlight SpellRare    cterm=underline             gui=undercurl guisp=cyan
highlight SpellBad     cterm=undercurl	gui=undercurl guisp=red
highlight SpellRare    cterm=undercurl	gui=undercurl guisp=cyan

highlight User1 term=inverse,bold  cterm=bold         ctermfg=yellow ctermbg=blue guifg=#d86020 guibg=#005c70 gui=inverse
if &term == "rxvt-unicode" || (&term == "screen" && $COLORTERM =~ "rxvt")
  highlight User2 term=inverse,bold  cterm=inverse,bold ctermfg=red  ctermbg=yellow  guifg=#d86020 guibg=#005c70 gui=NONE
else
  highlight User2 term=inverse,bold  cterm=inverse,bold ctermfg=blue ctermbg=white   guifg=#d86020 guibg=#005c70 gui=NONE
endif
highlight link User3 User1
highlight User4 term=inverse,bold  cterm=inverse,bold ctermfg=Red    guifg=Red   gui=inverse
highlight User5 term=inverse,bold  cterm=inverse,bold ctermfg=Cyan   guifg=Cyan  gui=inverse
highlight Search cterm=inverse,italic

" highlight link TabLine User1
" highlight link TabLineFill User2
" highlight link TabLineSel User3
hi TabLineFill term=underline cterm=underline gui=underline
hi TabLineSel term=bold cterm=bold
