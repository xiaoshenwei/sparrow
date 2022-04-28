" =============================================================================
" SETTING OPTIONS
" =============================================================================
" There are many options for Vim - over 200.   Here is an overview:
" http://www.vim.org/options54.txt   VIM-5.4   [990726] 218 options.
" http://www.vim.org/options57.txt   VIM-5.7   [000624] 219 options.
" http://www.vim.org/options60ae.txt VIM-6.0ae [010504] 283 options.
" =============================================================================

"       autoindent, paste, textwidth:
"       I keep changing these values - just as the case may be.
"       Now, if functions keys actually worked on all keyboards
"       then I'd probably defines a toggle for each of them...

set autoindent
set nosmartindent " smart indent is annoying for shell script comments !!!
set cinoptions=:0,(0
" filetype indent on

" set cursorline

"       autowrite: Automatically save modifications to files
"                  before commands like :next and :make
set   autowrite

set swapsync = ""
set nofsync

"       backspace:  '2' allows backspacing" over
"       indentation, end-of-line, and start-of-line.
"       see also "help bs".
  set   backspace=2

"       background:  Are we using a "light" or "dark" background?
  set   background=dark

"       compatible:  Let Vim behave like Vi?  Hell, no!
  set   nocompatible

"       comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
	" set   comments=b:#,:%,fb:-,n:>,n:)

"       cpoptions you should get to know - source of many FAQs!  ;-)
"       cpoptions:  "compatible options" to match Vi behaviour
" set   cpoptions="aABceFs"   "default!
"       FAQ:  Do NOT include the flag '<' if you WANT angle notation!
  set cpo-=<

"       dictionary: english words first
"  set   dictionary=/usr/share/dict/words,/home/mika/.vim/words.german
"       Source for dictionaries (in unix-format):
"       ftp://ftp.fu-berlin.de/misc/dictionaries/unix-format/
"       However, these are quite old.  Is there a better source?

"       digraph:    required for those umlauts
" set   digraph

"       errorbells: damn this beep!  ;-)
" set   noerrorbells

"       esckeys:    allow usage of cursor keys within insert mode
"       You will find this useful when working, eg, on SunOS.
  set   esckeys

"       expandtab:  Expand Tabs?  Rather not.
"                   See 'listchars' to make Tabs visible!
  set expandtab

"       formatoptions:  Options for the "text format" command ("gq")
"                       I need all those options (but 'o')!
  set   formatoptions=cqr

"       helpheight: zero disables this.
  set   helpheight=0

"       hidden:  Allow "hidden" buffers.  A must-have!
  set   hidden

"       highlight=8b,db,es,hs,mb,Mn,nu,rs,sr,tb,vr,ws
" set   highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws

"       hlsearch :  highlight search - show the current search pattern
"       This is a nice feature sometimes - but it sure can get in the
"       way sometimes when you edit.
  set   hlsearch

"       laststatus:  show status line?  Yes, always!
"       laststatus:  Even for only one buffer.
  set   laststatus=2

" [VIM5]lazyredraw:  do not update screen while executing macros
  set   lazyredraw

"       'list' + 'listchars': Great new feature of vim-5.3!
"       This tells Vim which characters to show for expanded TABs,
"       trailing whitespace, and end-of-lines.  VERY useful!!
" Standard settings:
" set   list
" set   listchars=tab:>-,trail:·,eol:$

" However: The '$' at the end of lines is a bit too much, though.
" And I quite like the character that shows a dot in the middle:
" set   listchars=tab:>·,trail:·

" Some people might prefer a double right angle (>>)
" to show the start of expanded tabs, though: ≪≪ ≫≫

" However, this all breaks up when viewing high-bit characters
" through some brain-dead telnet program (there are many).
" Sometimes a change of the font does the trick.  Try it!

"       magic:  Use 'magic' patterns  (extended regular expressions)
"       in search patterns?  Certainly!  (I just *love* "\s\+"!)
  set   magic

"       modeline:    ...
"       Allow the last line to be a modeline - useful when
"       the last line in sig gives the preferred textwidth for replies.
  set   modeline
  set   modelines=1

"       path:   The list of directories to search when you specify
"               a file with an edit command.
"               Note: "$VIM/syntax" is where the syntax files are.
"  set   path=.,,~/,$VIM/syntax/,~/.vim/syntax,~/.vim/macros
	set path=,,.,/usr/src/linux/include,/usr/include

"       report: show a report when N lines were changed.
"               report=0 thus means "show all changes"!
  set   report=0

"       ruler:       show cursor position?  Yep!
  set   ruler


"       shiftwidth:  Number of spaces to use for each
"                    insertion of (auto)indent.
" set   shiftwidth=8

"       shortmess:   Kind of messages to show.   Abbreviate them all!
"          New since vim-5.0v: flag 'I' to suppress "intro message".
" set   shortmess=at

"       showcmd:     Show current uncompleted command?  Absolutely!
  set   showcmd

"       showmatch:   Show the matching bracket for the last ')'?
  set   showmatch

"       showmode:    Show the current mode?  YEEEEEEEEESSSSSSSSSSS!
  set   showmode

"       suffixes:    Ignore filename with any of these suffixes
"                    when using the ":edit" command.
"                    Most of these are files created by LaTeX.
  set   suffixes=.aux,.bak,~,.dvi,.idx,.log,.ps,.swp,.tar

"       startofline:  no:  do not jump to first character with page
"       commands, ie keep the cursor in the current column.
  set   nostartofline

"       splitbelow:  Create new window below current one.
  set   splitbelow

"       tabstop: number of spaces that a <Tab> in the file counts for
  set   tabstop=8

"       tags: file for "tags" - search words
  set tags=./tags,tags,../tags,../../tags,/c/lkp-core/tags,/c/lkp-tests/tags,/c/kernel-tests/tags,/usr/include/tags,/usr/src/linux/tags

	autocmd FileType ruby set tags=./tags,tags,../tags,../../tags,/c/lkp-core/tags,/c/lkp-tests/tags,/c/kernel-tests/tags
	autocmd FileType c    set tags=./tags,tags,../tags,../../tags,/usr/include/tags,/usr/src/linux/tags

"       cscope

	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	cscope reset
	if filereadable("cscope.out")
	  cscope add     cscope.out $PWD
	elseif filereadable("obj-x86_64/cscope.out")
	  cscope add         obj-x86_64/cscope.out
	elseif filereadable("../cscope.out")
	  cscope add         ../cscope.out $PWD/..
	elseif filereadable("../obj-x86_64/cscope.out")
	  cscope add         ../obj-x86_64/cscope.out
	elseif filereadable("../../cscope.out")
	  cscope add         ../../cscope.out $PWD/../..
	elseif filereadable("../../obj-x86_64/cscope.out")
	  cscope add         ../../obj-x86_64/cscope.out
	elseif filereadable("../../../cscope.out")
   cscope add          ../../../cscope.out $PWD/../../..
	elseif filereadable("../../../obj-x86_64/cscope.out")
   cscope add          ../../../obj-x86_64/cscope.out
	elseif filereadable("../../../../cscope.out")
   cscope add         ../../../../cscope.out $PWD/../../../..
	elseif filereadable("../../../../obj-x86_64/cscope.out")
   cscope add          ../../../../obj-x86_64/cscope.out
	elseif filereadable("../../../../../cscope.out")
   cscope add          ../../../../../cscope.out $PWD/../../../../..
	elseif filereadable("../../../../../obj-x86_64/cscope.out")
   cscope add          ../../../../../obj-x86_64/cscope.out
	endif
	set csverb

	" for dir in ['.', '..', '../..', '../../..', '../../../..', '../../../../..']
	" 	let file = dir . '/cscope.out'
	" 	if filereadable(file)
	" 		let prepath = $PWD . '/' . dir
	" 		cscope add file prepath
	" 		break
	" 	endif
	" 	let file = dir . '/obj-x86_64/cscope.out'
	" 	echo file
	" 	if filereadable(file)
	" 		cscope add file $PWD . '/' . dir
	" 		break
	" 	endif
	" endfor
	" if filereadable("/usr/src/linux/cscope.out")
	" 	 cscope add "/usr/src/linux/cscope.out"
	" endif

	" if has("netbeans_intg")
		" set autochdir
	" endif

" 990503: I have to set the "term" explicitly
" because the standard setups are broken.
" set   term=builtin_pcansi
" set   term=xterm

" Set the colors for vim on "xterm"
" if &term=="xterm"
" set t_Co=8
" set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
" set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
" endif

" If you are a Linux user editing with Vim in the console, you can put the
" following in your .vimrc to have a nice non-blinking block cursor like in a xterm:
" See Documentation/VGA-softcursor.txt in the kernel sources for details about this escape sequence.
" if &term == "linux"
"   set t_ve+=[?81;0;112c
" endif


"  if &term=="screen" && $COLORTERM=~"rxvt"
"    " italic
	 " set t_ZH=[3m
	 " set t_ZR=[23m
"  endif

" set to blinking code, my customized urxvt will show undercurl instead
" set t_Cs="\e[5m"
" set t_Ce="\e[25m"
if exists('+t_Cs')
	let &t_Cs = "\e[5m"
  let &t_Ce = "\e[25m"
endif

" make italic work
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"       textwidth
" set  textwidth=77

"       title: default value is off
"       When on, the title of the window will be set to the value of
"          'titlestring' (if it is not empty), or to:
"          filename [+=-] (path) - VIM
  set   title

if exists('$SSH_CONNECTION')
	let &titlestring = hostname() . ":" . expand("%:p")
" else
	" set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
end

"       ttyfast:     are we using a fast terminal?
"                    seting depends on where I use Vim...
  set   nottyfast

"       ttybuiltin: default value is on
"       When on, the builtin termcaps are searched before the external ones.
"       When off the builtin termcaps are searched after the external ones.
  set   nottybuiltin

"       ttyscroll:      turn off scrolling -> faster!
  set   ttyscroll=0

"       ttytype: string (default from $TERM)
" set   ttytype=rxvt

"       visualbell: Use visual bell instead of beeping. Very usefull if you
"       don't like sound or try to keep your neighbours friendly ;-))
  set   visualbell

"       t_vb:  terminal's visual bell - turned off to make Vim quiet!
"       Please use this as to not annoy cow-orkers in the same room.
"       Thankyou!  :-)
" set   t_vb=

"       wildchar  the char used for "expansion" on the command line
"                 default value is "<C-E>" but I prefer the tab key
  set   wildchar=<TAB>

"       wrapmargin:
"       When do you want the line to break? A value of 1 means that 1
"       "cursor" before the end of the visible screen.
"       if wrapmargin=n, then the wrapping occurs if the distance to the
"       right screen-border is "n" spaces
" set   wrapmargin=1

"       writebackup: Make a backup before overwriting a file.  The backup is
"       removed after the file was successfully written, unless the 'backup'
"       option is also on.
"       I don't like this setting because it's just for losers ;-)
" set   nowritebackup

" 020628 By default, Vim displays the current line of each minimized file,
" which (to me) isn't much help and takes up too much screen real estate.
  " set winminwidth=0


  set ignorecase	" Do case insensitive matching
	set infercase
  set smartcase
  set incsearch		" Incremental search

  set history=5000

"       viminfo:  What info to store from an editing session
"                 in the viminfo file;  can be used at next session.
" set   viminfo=%,'50,\"100,:100,n~/.viminfo
if v:version <= 603
  set   viminfo='500,n~/.vim/viminfo
else
  set   viminfo='500,s100,n~/.vim/viminfo
end

	" if has("gui")
		" set guioptions-=a
		" set clipboard-=autoselect
		" set clipboard=autoselect,exclude:cons\|linux
	" end

" have % bounce between angled brackets, as well as t'other kinds.
"set matchpairs+=<:>

" have the cursor keys wrap between lines in insert mode,
" and ~ convert case over line break.
  set whichwrap=~,[,],<,>,h,l

  set wildignore=.*,*.cgz,*.gz,*.bz2,*.xz,*.tgz,*.tbz,*.zip,*.rar,*.mp3,*.png,*.jpg,*.o,*.obj,*.bak,*.exe,*.pack,*.idx,*.bc,*~

  set wildmenu
  set wildmode=list:longest,list:full
  set wcm=<C-Z>
	" set foldlevel=1
	" set foldminlines=10
  set scrolloff=3
  set winaltkeys=no

  set winminheight=0

"set winheight=999

"       ttyfast: are we using a fast terminal?
"                seting depends on where I use Vim...
  set   nottyfast

"       ttyscroll: turn off scrolling -> faster!
  set   ttyscroll=3

	" gf on VAR=file
	set isfname-==

  set esckeys
  set timeout ttimeout timeoutlen=500 ttimeoutlen=50

  set backup
  set backupdir=/tmp

" let g:Tlist_Ctags_Cmd='/usr/bin/ctags'
" let g:Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1 
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1

" =============================================================================
" Status line
" =============================================================================
"       statusline:  customize contents of the windows' status line.
"       I prefer it this way:
"       Show the current buffer number and filename with info on
"       modification, read-only, and whether it is a help buffer
"       (show only when applied).
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)

"       Move the rest to the right side, eg a copyright text:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)%=(c)\ Michael\ Prokop

"       Show the value of the current character in ASCII and Hex:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=ASCII=%b\ HEX=%B

"       Show the current position with line+column+virtual_column:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=Pos=<%l\,%c%V>\ %P
"       Adding color through UserN groups:
" set   statusline=%1*[%02n]%*\ %2*%F%*\ %(\ %M%R%H)%)%=%3*Pos=<%l,%c%V>%*

"       My favourite statusline is:
"set statusline=%<[%n]\ %f\ %y\ %r\ %1*%m%*%w%=%(Column:\ %c%V%)%4(%)%-10(Line:\ %l%)\ %4(%)%p%%\ %P\ \ \ \ \ \ ASCII=%b\ HEX=%B\ \ \ \ \ %=(c)\ Michael\ Prokop

"       Another favourite:
"  set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=Pos=<%l\,%c%V>\ %P\=ASCII=%b\ HEX=%B)%=(c)\ Michael\ Prokop

"       User1: color for buffer number
" hi    User1 ctermfg=red   ctermbg=white
"       User2: color for filename
" hi    User2 ctermfg=green ctermbg=white
" hi    User2 ctermfg=green ctermbg=black
"       User3: color for position
" hi    User3 ctermfg=blue  ctermbg=white

"if $LANG == 'zh_CN.GBK'
"	set statusline=\[%l,%c%V\]%o\ %b\[0x%B\]\ %{ShowTab()}\ [%{BytePercent()}%%]%P\ %w%h%m%r[%{&ff}]%y%<%F%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%=\ %{strftime(\"%x\ 星期%a\ %R\",getftime(expand(\"%:p\")))}\ %n
"else
  " by WFG
	" set statusline=%f%(\ [%M%R%H%W]%)%=%(C%c%V%)%1(%)%-1(L%l/%L%)\ \ %p%%%{((&fenc==\"\")?\"\":\"\ \".&fenc)}
	" set statusline=\[%l,%c%V\]%o\ %b\[0x%B\]\ %{ShowTab()}\ [%{BytePercent()}%%]%P\ %w%h%m%r[%{&ff}]%y%<%F%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%=\ %{strftime(\"%x\ %R\",getftime(expand(\"%:p\")))}\ %n
"end

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\-\ %H:%M\")}
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
"set statusline=%{strftime(\"%c\",getftime(expand(\"%:p\")))}
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\
"%{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\pos:%o\ ascii:%b\ %P


"       statusline:  customize contents of the windows' status line.
"       Can't see it? Check out "set laststatus"!
"       I prefer it this way:
"       Show the current buffer number and filename with info on
"       modification, read-only, and whether it is a help buffer
"       (show only when applied).
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)

"       Move the rest to the right side, eg a copyright text:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)%=(c)\ Michael\ Prokop

"       Show the value of the current character in ASCII and Hex:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=ASCII=%b\ HEX=%B

"       Show the current position with line+column+virtual_column:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=Pos=<%l\,%c%V>\ %P

"       Adding color through UserN groups:
" set   statusline=%1*[%02n]%*\ %2*%F%*\ %(\ %M%R%H)%)%=%3*Pos=<%l,%c%V>%*

"       One favourite:
" set   statusline=[%n]\ %f\ %(\ %M%R%H)%)\=Pos=<%l\,%c%V>\ %P\=ASCII=%b\ HEX=%B)%=(c)\ Michael\ Prokop

"       My favourite statusline is:
"    set statusline=%<[%n]\ %f\ %y\ %r\ %1*%m%*%w%=%(Column:\ %c%V%)%4(%)%-10(Line:\ %l%)\ %4(%)%p%%\ %P\ \ \ \ \ \ ASCII=%b\ HEX=%B\ \ \ \ \ %=(c)\ Michael\ Prokop


	set statusline=%<\ %1*%{GetBufferList(1)}%2*%{GetBufferList(2)}%1*%{GetBufferList(3)}%3*%*%w%=%(C%c%V%)%1(%)%-1(L%l/%L%)\ \ %p%%%{((&fenc==\"\")?\"\":\"\ \".&fenc)}

" function for bufferlist in statusline - written by Thomas Winkler
  function! GetBufferList(class)
    if(&buflisted == 0 || &buftype != '')
      if(a:class == 1)
        return &buftype
      endif
    endif

    let l:numBuffers = bufnr('$')
    let l:i = 0
    let l:c = 1

    if(3 == a:class)
      let l:bufferList = "  "
    else
      let l:bufferList = ''
    endif

    while(l:i <= l:numBuffers)
      let l:i = l:i + 1
      if bufnr("") == l:i
        let l:c = l:c + 1
      elseif bufnr("") == l:i-1
        let l:c = l:c + 1
      endif

      if(getbufvar(l:i, '&buflisted') == 1) " check if buffer is listed
        let l:bufName = bufname(l:i)

        if(strlen(l:bufName))
          let l:shortBufName = fnamemodify(l:bufName, ":t")
          let l:shortBufName = substitute(l:shortBufName, '[][()]', '', 'g')

          " check if buffer is readonly
          if (getbufvar(l:i, '&readonly'))
            let l:shortBufName = l:shortBufName . '|RO'
          endif

          if(l:c == a:class)
            if(getbufvar(l:i, '&modified') == 1) " check if buffer is modified
							let l:shortBufName = '+' . l:shortBufName
            "elseif(bufwinnr(l:i) != -1) " check if buffer is currently open in a window
            "  let l:shortBufName = '*' . l:shortBufName
            else
							let l:shortBufName = '|' . l:shortBufName
            endif
            if(2 != a:class)
              let l:shortBufName = l:shortBufName . ' '
            endif

            let l:bufferList = l:bufferList .  l:i . l:shortBufName
          endif

        endif
      endif
    endwhile

    return l:bufferList
  endfunction


function! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999X X'
	endif

	"echomsg 's:' . s
	return s
endfunction

function! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let numtabs = tabpagenr('$')
	" account for space padding between tabs, and the "close" button
	let maxlen = ( &columns - ( numtabs * 2 ) - 4 ) / numtabs
	let tablabel = bufname(buflist[winnr - 1])
	" while strlen( tablabel ) < 4
		" let tablabel = tablabel . " "
	" endwhile
	let tablabel = fnamemodify( tablabel, ':t' )
	let tablabel = a:n . "|" . tablabel
	let tablabel = strpart( tablabel, 0, maxlen )
	return tablabel
endfunction

" set tabline=%!MyTabLine()

" set showtabline=1 " 2=always

"cabbrev q qa
"cabbrev qq q!
cabbrev gg GG

autocmd QuickFixCmdPost *grep* cwindow

function WrapForTmux(s)
	" when starting gnome-terminal from inside tmux, the $TMUX env
	" will be inherited. So need to test TERM.
	if ! (exists('$TMUX') && ($TERM =~ "tmux" || $TERM =~ "screen"))
		return a:s
	endif

	let tmux_start = "\<Esc>Ptmux;"
	let tmux_end = "\<Esc>\\"

	return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
" this sometimes cause cursor display problem, cursor in old position cannot
" be wiped out.
if 0 " exists('+t_SR')
	if exists('$KONSOLE_DBUS_SESSION')
		let &t_SI = "\e]50;CursorShape=1\x7"
		let &t_SR = "\e]50;CursorShape=2\x7"
		let &t_EI = "\e]50;CursorShape=0\x7"
	else
		let &t_SI .= WrapForTmux("\e[6 q")
		let &t_SR .= WrapForTmux("\e[4 q")
		let &t_EI .= WrapForTmux("\e[2 q")
	endif
endif

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-agignore\ $HOME/.agignore

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
	" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind , (backward slash) to grep shortcut
  " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  " nnoremap , :Ag<SPACE>
endif


" handy when mouse is on, otherwise will mess up urxvt copy/paste
" set number

" set mouse=a

" https://github.com/wincent/terminus/pull/14
" fix mouse not working under TERM=tmux
if $COLORTERM =~ "rxvt"
	set ttymouse=urxvt
else
	set ttymouse=sgr
endif

" wfg: let my customized rxvt-unicode do the paste
map <MiddleMouse>	<Nop>
map <2-MiddleMouse>	<Nop>
map <3-MiddleMouse>	<Nop>
map <4-MiddleMouse>	<Nop>
imap <MiddleMouse>	<Nop>
imap <2-MiddleMouse>	<Nop>
imap <3-MiddleMouse>	<Nop>
imap <4-MiddleMouse>	<Nop>

map <2-LeftMouse>	<Nop>
map <3-LeftMouse>	<Nop>
map <4-LeftMouse>	<Nop>
imap <2-LeftMouse>	<Nop>
imap <3-LeftMouse>	<Nop>
imap <4-LeftMouse>	<Nop>

" map <MiddleMouse>	:set paste<CR>i
" imap <MiddleMouse>	<ESC>:set paste<CR>i
" imap <MiddleRelease>	<ESC>:set nopaste<CR>i
" map <MiddleRelease>	:set nopaste<CR>
" imap <MiddleRelease>	<ESC>:set paste<CR>:i

let g:NERDSpaceDelims = 1

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#enable_fuzzy_completion = 0
" let g:neocomplete#max_list = 10
let g:neocomplete#enable_cursor_hold_i = 1
" let g:neocomplete#cursor_hold_i_time = 500
" let g:neocomplete#skip_auto_completion_time = 3
" set updatetime=500

if exists('*neocomplete#custom#source')
	autocmd FileType ruby,eruby call neocomplete#custom#source('tag', 'disabled', 1)
	autocmd FileType ruby,eruby call neocomplete#custom#source('tmux-complete', 'disabled', 1)
endif
" call neocomplete#custom#source('ruby', 'disabled', 0)

" let g:neoinclude#paths = { "/c/lkp-core", "/c/lkp-tests", "/c/kernel-tests" }

" if !exists('g:neocomplete#force_omni_input_patterns')
	" let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '\h\w*'
" \ '[^. *\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns['ruby'] = '\h\w*'

" '[^. *\t]\.\h\w*\|\h\w*::'
	" let g:neocomplete#force_overwrite_completefunc = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

command! LessKeys runtime macros/less.vim

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" vim:sw=2:ts=2
