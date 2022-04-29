" =============================================================================
" MAPpings
" =============================================================================
" Caveat:  Mapping must be "prefix free", ie no mapping must be the
" prefix of any other mapping.  Example:  "map ,abc foo" and
" "map ,abcd bar" will give you the error message "Ambigous mapping".

" The backslash ('\') is the only(?) unmapped key, so this is the best
" key to start mappings with as this does not take away a command key.
" However, the backslash is never in the same position with keyboards.
" Eg on German keyboards it is AltGr-sz - don't ask.
" Anyway, I have decided to start mappings with the comma as this
" character is always on the same position on almost all keyboards
" and I hardly have a need for that command.
  let mapleader = ","
  let maplocalleader = ","

  nmap <Leader>-	yypVr-
  nmap <Leader>=	yypVr=

" =============================================================================
" Define some escape sequences from rxvt-unicode
" =============================================================================
map <Char-033>[Z                <S-Tab>
map <Char-033><lt>C-Tab>        <C-Tab>
map <Char-033><lt>S-Space>      <S-Space>
map <Char-033>[c                <S-Right>
map <Char-033>[d                <S-Left>
map <Char-033>[a                <S-Up>
map <Char-033>[b                <S-Down>
map <Char-033>Oc                <C-Right>
map <Char-033>Od                <C-Left>
map <Char-033>Oa                <C-Up>
map <Char-033>Ob                <C-Down>
map <Char-033>[1;3A             <M-Up>
map <Char-033>[1;3B             <M-Down>
map <Char-033>[1;3C             <M-Right>
map <Char-033>[1;3D             <M-Left>
map <Char-033><lt>C-Return>     <C-Return>
map <Char-033><lt>S-Return>     <S-Return>
map <Char-033><Char-015>        <M-Return>
map <Char-033><lt>C-,>          <C-,>
map <Char-033><lt>C-.>          <C-.>
map <Char-033><lt>C-/>          <C-/>
map <Char-033><lt>C-;>          <C-;>
map <Char-033><lt>C-'>          <C-'>

let char = '0'
while char != '9'
        execute "map"  "<Char-033><lt>M-C-" . (char) . ">"  "<M-C-" . (char) . ">"
        execute "map!" "<Char-033><lt>M-C-" . (char) . ">"  "<M-C-" . (char) . ">"
        execute "map"  "<Char-033><lt>C-" . (char) . ">"  "<C-" . (char) . ">"
        execute "map!" "<Char-033><lt>C-" . (char) . ">"  "<C-" . (char) . ">"
        execute "map"  "<Char-033>" . (char) "<M-" . (char) . ">"
        let char = nr2char(1 + char2nr(char))
endwhile

let char = 'a'
while char != 'z'
        execute "map"  "<Char-033><lt>M-C-" . (char) . ">"  "<M-C-" . (char) . ">"
        execute "map!" "<Char-033><lt>M-C-" . (char) . ">"  "<M-C-" . (char) . ">"
        execute "map"  "<Char-033>" . (char) "<M-" . (char) . ">"
        let char = nr2char(1 + char2nr(char))
endwhile

" =============================================================================
" Improve some keys
" =============================================================================

" When the backspace key sends a "delete" character
" then you simply map the "delete" to a "backspace" (CTRL-H):
" map <Del> <C-H>

" Disable the suspend for ^Z.
" I use Vim under "screen" where a suspend would lose the
" connection to the " terminal - which is what I want to avoid.
  map <C-Z> :shell<CR>

" Make CTRL-^ rebound to the *column* in the previous file
" noremap <C-^> <C-^>`"

" Make "gf" rebound to last cursor position (line *and* column)
" noremap gf gf`"

" The command {number}CTRL-G show the current nuffer number, too.
" This is yet another feature that vi does not have.
" As I always want to see the buffer number I map it to CTRL-G.
" Pleae note that here we need to prevent a loop in the mapping by
" using the comamnd "noremap"!
  noremap <C-G> 2<C-G>


" 020628 I'm used to complete words with <tab>, however when editing source I
" can't just map that to vim keyword completion because I sometime need to
" insert real tabs, since it mostly happen when at the beginning of the line
" or after a ; and before a one line comma (java, c++ or perl anyone...)
" I've come to find the following really usefull.
" This is how you can map the <tab> key in insert mode while still being able
" to use it when at the start of a line or when the preceding char is not a
" keyword character.

" Simple function:
" function InsertTabWrapper()
"      let col = col('.') - 1
"      if !col || getline('.')[col - 1] !~ '\k'
"          return "\<tab>"
"      else
"          return "\<c-p>"
"      endif
" endfunction
" -> then define the appropriate mapping:
"  inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" I have found a more complex functions which also works in either direction:
" function! InsertTabWrapper(direction)
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"       return "\<tab>"
"   elseif "backward" == a:direction
"       return "\<c-p>"
"   else
"       return "\<c-n>"
"   endif
" endfunction
" -> then definde the appropriate mappings:
" inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
" inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" My intelligent tab completion
function! <SID>InsertTabWrapper(direction)
	let idx = col('.') - 1
	let str = getline('.')

	if a:direction > 0 && idx >= 2 && str[idx - 1] == ' '
				\&& str[idx - 2] =~? '[a-z]'
		if &softtabstop && idx % &softtabstop == 0
			return "\<BS>\<Tab>\<Tab>"
		else
			return "\<BS>\<Tab>"
		endif
	"elseif idx == 0 || str[idx - 1] !~? '[a-z]'
	elseif idx == 0 || ( strpart(getline('.'), idx-1, 1) !~ '[a-z]'
				\|| strpart(getline('.'), idx, 1) =~ '\k' )
		return "\<Tab>"
	elseif a:direction > 0
		return "\<C-p>"
	else
		return "\<C-n>"
	endif
endfunction

"inoremap <silent> <Tab> <C-r>=<SID>InsertTabWrapper(1)<CR>
"inoremap <silent> <S-Tab> <C-r>=<SID>InsertTabWrapper(-1)<CR>

" =============================================================================
" The following maps get rid of some basic problems:
" =============================================================================

" 980527 I often reformat a paragraph to fit some textwidth -
" and I use the following mapping to adjust it to the
" current position of the cursor:
" map #tw :set textwidth=<C-R>=col(".")<C-M>

" 001010  Do the Color Test!
" map ,CT :sp $VIMRUNTIME/syntax/colortest.vim<cr>:so %<cr>

" 000329  View the file which defines the "filetypes":
" map ,F :view $VIMRUNTIME/filetype.vim

" 980311  Sourcing syntax files::
" map ,SO :source $VIMRUNTIME/syntax/

" 980706,000310 View a syntax file:
" map ,V  :view $VIMRUNTIME/syntax/

" 000801     Hilite Test - show all current highlight groups
" see ":help hitest.vim"
" map ,HI :so $VIMRUNTIME/syntax/hitest.vim

" 990614  Quick insertion of an empty line:
  " nnoremap <C-Return> i<Return><ESC>
  nnoremap <ESC><Return> o<ESC>
  nnoremap <ESC><Space>  i<Space><ESC>

" 020523 Create html-file based on text:
" map ,t2h :so $VIMRUNTIME/syntax/2html.vim

" 020523 Some useful mappings for programming
" map ,deb o#ifdef DEBUGMESSAGE<CR>fprintf(stderr,ANSI_COLOR_RED)&lt;CR>fprintf(stderr,"\n")&lt;CR>fprintf(stderr,COLOR_OFF)&lt;CR>#endif<ESC>kk$hhhhi
" map ,m :w<CR>:!make<CR>
" map ,Kom o/**/<ESC>hi<RETURN>*<RETURN><ESC>60a*<ESC>kk60i*<ESC>jYpPA<SPACE>
" map ,kom o/**/<ESC>hi<RETURN>*<RETURN><ESC>^4i+<ESC>kk4A+<ESC>jYpPA<SPACE>
" map ,if <ESC>oif()<CR>{<CR>}<ESC>kk$i
" map ,for ofor(;;)<CR>{<CR>}<ESC>kk$hhi
" map ,els oelse<CR>{<CR>}<ESC>O

" 020628 Set the compiler for programming in C - typing :make will run the
" command gcc file.c -o file
" set makeprg=gcc\ -o\ %<\ %

" 020628 I find this a very useful command to use. Use "Make" instead of
" "make" !!!
" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" if no errors, it closes any open cwindow.
  command -nargs=* Make make <args> | cwindow 3

  command -nargs=+ GG execute 'silent Ggrep!' <q-args>

" have <C-F9> run a :make
noremap <F9> :Make<CR>

" 020628 To automatically insert a closing parenthesis when typing an opening
" parenthesis:
"  inoremap ( ()<ESC>i
"  inoremap { {}<ESC>i
"  inoremap [ []<ESC>i
" -> it ends up with the cursor between the opening and the closing parenthesis
" in insert mode.

" 020628 Occasionally I later want already written text parts to put in parenthesis.
" I use the following macro, which brackets previously visually selected text.
" I mapped it with _(.
" vnoremap _( <ESC>`>a)<ESC>`<i(<ESC>
" Furthermore, a sort of mapping for bracketing a *single word* is
" conceivable.
" Because this is not as general like the kind of visual mode mapping, I use
" this kind of "word bracketing" only for surrounding the word right behind
" the cursor in insert mode with **.  I use the following macro to "emphasize"
" the word i just typed, for newsgroup articles.
" imap _* <Esc>bi*<Esc>ea*<Space>

" 020628 To check the english spelling I use the engspchk.vim
"  map ,sp <ESC>:so ~/.vim/dictionary/engspchk.vim<CR>i

" 020708  Edit compile speedup (hotkeys)
" --------- start info -----------------
" F2 - update file without confirmation
" F3 - file open dialog
" F6 - list all errors
" F7 - display previous error
" F8 - display next error
" --------- end info -------------------
" map <F2>  :update<CR>
" map <F3>  :browse confirm e<CR>
" map <F6>  :copen<CR>
" map <F7>  :cp<CR>
" map <F8>  :cn<CR>

" 020708 A mapping for more effective use of latex und gcc compiling
" Thanks to Thorsten Zerha for providing me this functions!
" map <F7> : call CompileRunPDF()<CR>
" map <F8> : call CompileGcc()<CR>

" func! CompileRunPDF()
" exec "w"
" exec "!latex % && dvipdf %<.dvi && acroread %<.pdf"
" exec "i"
" endfunc

" func! CompileGcc()
" exec "w"
" exec "!gcc % -o %<  && IF EXIST %< (cr 5 && banner -c # Success) ELSE banner -c # Compile Unsuccessful "
" exec "i"
" endfunc

" 020523
" ,dir shows the current directory-content
" ,gf  edits the file in the current row respectively shows the
"      content of the current directory
  map ,ls :sp ~/tmp/vimdir<CR>G1dG:r!ls -al<CR>:se nomod<CR>
  no ,gf $T y$:if isdirectory("<C-R>"")<CR>:cd <C-R>"<CR>:bd<CR>:norm ,dir<CR>else<CR>:norm gf<CR>endif<CR>

" https://stackoverflow.com/questions/2415237/techniques-in-git-grep-and-vim
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
func GitGrepWord()
  call GitGrep('-w -e ', expand("<cword>")) " getreg('/'))
endf
"nmap g/ :silent call GitGrepWord()<CR>

" https://fooyou.github.io/document/2015/12/01/find-text-in-project-within-vim.html
"map <F5> :execute "lvimgrep /" . expand("<cword>") . "/gj **/*" <Bar> lw<CR>
"nmap g. :noautocmd :execute "vimgrep /" . getreg('/') . "/gj **/*" <Bar> lw<CR>:cw<CR>
nmap g. :noautocmd :execute "vimgrep //gj **/*" <Bar> lw<CR>:cw<CR>
nmap g/ :noautocmd :execute "vimgrep //gj \`git ls-files $(git rev-parse --show-toplevel)\`" <Bar> lw<CR>:cw<CR>

" 020526 search the current word in all files in the working directory
"  nnoremap g/ :silent Grep <C-R>/ <C-R>=expand("%:p:h")<CR>/*<CR><CR>
"  vnoremap g/ y/\V<C-R>=escape(@",'/\')<CR><CR>
  " nnoremap g/ :silent Ggrep! "<C-R>/"<CR>

" 020526 Javamappings -> usefull keymappings for programming Java
"  map ,java :so ~/.vim/macros/javamappings.vim<CR>

" 020526 JavaRun -> very usefull for compiling and running .java-Files
"  map ,jrun :so ~/.vim/macros/JavaRun.vim<CR>

" 020526 Usefull abbreviations for C-Programming
"  map ,c :so ~/.vim/macros/c1.vim<CR>

" 020526 Very usefull mapping for editing C-Programms
"  map ,dr :so ~/.vim/macros/drcstubs.vim<CR>

" 020526 Very nice file-browser - enaable it with _ls
"  map ,ls :so ~/.vim/macros/browser.vim<CR>

" 020526 ROT13 Macro for coding - enable it with gr
"  map ,rot :so ~/.vim/macros/rot13.vim<CR>

" 020526 Enable a nice ruler - enable it with @r
"  map ,ru :so ~/.vim/macros/ruler2.vim<CR>

" 020526 A macro which allows you to open a "shell" in a new window - enable it with :vish
"  map ,sh :so ~/.vim/macros/vish.vim<CR>

" 020526 Abbreviation for the $macro-directory
"  map ,mc :so ~/.vim/macros/

" 020610 A macro which allows me to write LaTeX-Files without thinking about
" umlauts ;-)
"  map ,tex :so ~/.vim/macros/latex.vim<CR>

" =============================================================================
" Customizing the command line
" =============================================================================
" Valid names for keys are:  <Up> <Down> <Left> <Right> <Home> <End>
" <S-Left> <S-Right> <S-Up> <PageUp> <S-Down> <PageDown>  <LeftMouse>

" Many shells allow editing in "Emacs Style".
" Although I love Vi, I am quite used to this kind of editing now.
" So here it is - command line editing commands in emacs style:
  cnoremap <C-A>      <Home>
  cnoremap <C-B>      <Left>
"  cnoremap <C-B>      <Del>
  cnoremap <C-E>      <End>
  cnoremap <C-F>      <Right>
" cnoremap <C-N>      <End>
" cnoremap <C-P>      <Up>
  cnoremap <ESC>b     <S-Left>
" cnoremap <ESC><C-B> <S-Left>
  cnoremap <ESC>f     <S-Right>
" cnoremap <ESC><C-F> <S-Right>
  cnoremap <ESC><C-H> <C-W>
" Note:  More info about this is in the helptexts:  :help emacs-keys

" Additional codes for that "English" keyboard at the Xterminal
  cnoremap <ESC>[D <Left>
  cnoremap <ESC>[C <Right>

" =============================================================================
" VIM - Editing and updating the vimrc:
" As I often make changes to this file I use these commands
" to start editing it and also update it:
" if has("unix")
"   let vimrc='~/.vimrc'
" else
" ie:  if has("dos16") || has("dos32") || has("win32")
"   let vimrc='$VIM\_vimrc'
" endif
" nn  ,u :source <C-R>=vimrc<CR><CR>
" nn  ,v :edit   <C-R>=vimrc<CR><CR>
  nn  <Leader>vo :e   ~/.vim/option.vimrc<CR><CR>
  nn  <Leader>vk :e   ~/.vim/key.vimrc<CR><CR>
"     ,v = vimrc editing (edit this file)
" map ,v :e ~/.vimrc<CR>
"     ,u = "update" by reading this file
" map ,u :source ~/.vimrc<CR>
" =============================================================================
" General Editing

" Define "del" char to be the same backspace (saves a LOT of trouble!)
" As the angle notation cannot be use with the LeftHandSide
" with mappings you must type this in *literally*!
" map <C-V>127 <C-H>
" cmap <C-V>127 <C-H>
" the same for Linux Debian which uses
" imap <Esc>[3~ <C-H>

"      ,rcm = remove "control-m"s - for those mails sent from DOS:
  cmap ,rcm %s/<C-M>//g

" =============================================================================
" Inserting Dates and Times / Updating Date+Time Stamps
" =============================================================================
"     ,L  = "Last update" - replace old time stamp with a new one
"        preserving whitespace and using internal "strftime" command:
"       requires the abbreviation  "YDATE"
" map ,L  1G/Latest change:\s*/e+1<CR>CYDATE<ESC>
" map ,,L 1G/Last update:\s*/e+1<CR>CYDATE<ESC>
" Example:
" before:  "Last update:   Thu Apr  6 12:07:00 CET 1967"
" after:   "Last update:   Tue Dec 16 12:07:00 CET 1997"

"  I used to read in the output from the external command "date"
"  but this is a little slow and does not work on all systems -  have a look:
"  map ,L 1G/Last update: */e+1<CR>D:r!date<CR>kJ

" cscope find symbol
nmap ,. :cs find s <C-R>=expand("<cword>")<CR><CR>

" white space
nmap ,s        /\s\+$<CR>
nmap ,d        :%s///g<CR>

" =============================================================================
" General Editing - link to program "screen"
" =============================================================================

"       ,Et = edit temporary file of "screen" program
" map   ,p :r /tmp/screen-exchange<CR>
" if $DISPLAY != ''
" 	map   ,p "*p
" 	map   ,y "*y
" else
" 	" need fakeclip, copy/paste to tmux buffer
" 	map   ,p "&p
" 	map   ,y "&y
" endif

" https://sunaku.github.io/tmux-yank-osc52.html#osc-52-the-new-way
" copy the current text selection to the system clipboard
if has('clipboard') && exists('$DISPLAY')
	noremap <Leader>y "*y
	noremap <Leader>p "*p
else
	" copy to attached terminal using the yank(1) script:
	" https://github.com/sunaku/home/blob/master/bin/yank
	" noremap <silent> <Leader>y y:call system('yank > /dev/tty', @0)<Return>
	" WFG: @0 cannot work in remote ssh sessions, getreg() works
	noremap <silent> <Leader>y y:call system('yank > /dev/tty', getreg('"'))<Return>

	" need fakeclip, paste from tmux buffer
	noremap <Leader>p "&p
endif

" map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"       as a user of Unix systems you *must* have this program!
"       see also:  http://www.math.fu-berlin.de/~guckes/screen/

" Email/News - Editing replies/followups

" Part 1 - prepare for editing

" Part 2 - getting rid of empty (quoted) lines and space runs.

" Delete trailing whitespace:
 " nmap ,rts :%s/\s\+$//
 " vmap ,rts :s/\s\+$//

"      ,cel = "clear empty lines"
"       - delete the *contents* of all lines which contain only whitespace.
"         note:  this does not delete lines!
" map ,cel :g/^[<C-I> ]*$/d
  " map ,cel :%s/^\s\+$//

"      ,del = "delete 'empty' lines"
"       - delete all lines which contain only whitespace
"         note:  this does *not* delete empty lines!
  " map ,del :g/^\s\+$/d

"      ,cqel = "clear quoted empty lines"
"       Clears (makes empty) all lines which start with '>'
"       and any amount of following spaces.
" nmap ,cqel :%s/^[> ]*$//
" vmap ,cqel  :s/^[> ]*$//
" nmap ,cqel :%s/^[><C-I> ]\+$//
" vmap ,cqel  :s/^[><C-I> ]\+$//
" nmap ,cqel :%s/^[>]\+$//
" vmap ,cqel  :s/^[><C-I> ]\+$//
" NOTE: If the meta sequence "\s"
" The following does not work because "\s" is not a character
" and thus cannot be part of a "character set".
"  map ,cqel  :%s/^[>\s]\+$//

" Some people have strange habits within their writing.
" But if you cannot educate them - rewrite their text!  ;-)

" Jason "triple-dots" King elephant@onaustralia.com.au
" does uses ".." or "..." rather than the usual punctuation
" (comma, semicolon, colon, full stop). So...

" Turning dot runs with following spaces into an end-of-sentence,
" ie dot-space-space:
" vmap ,dot :s/\.\+ \+/.  /g

" Gary Kline (kline@tera.tera.com) indents his
" own text in replies with TAB or spaces.
" Here's how to get rid of these indentation:
" vmap ,gary :s/^>[ <C-I>]\+\([^>]\)/> \1/

"      ,ksr = "kill space runs"
"             substitutes runs of two or more space to a single space:
  " nmap ,ksr  :%s/  */ /g
  " vmap ,ksr   :s/  */ /g
" nmap ,ksr  :%s/  \+/ /g
" vmap ,ksr   :s/  \+/ /g
" nmap <F10> vip:s/  \+/ /g
" vmap <F10>    :s/  \+/ /g

" Why can't the removal of space runs be
" an option of "text formatting"? *hrmpf*

"    ,Sel = "squeeze empty lines"
"    Convert blocks of empty lines (not even whitespace included)
"    into *one* empty line (within current visual):
   " map ,sel :g/^$/,/./-j

"    ,Sbl = "squeeze blank lines"
"    Convert all blocks of blank lines (containing whitespace only)
"    into *one* empty line (within current visual):
"  map ,Sbl :g/^\s*$/,/[^ <C-I>]/-j
"  map ,Sbl :g/^\s*$/,/[^ \t]/-j
   " map ,sbl :g/^\s*$/,/\S/-j

"   View a html document (or part of it) with lynx. You need
"   a system that supports the /def/fd/* file descriptors :-(
" nmap ,ly :w !lynx -force_html /dev/fd/0<CR>
" vmap ,ly :w !lynx -force_html /dev/fd/0<CR>

" Make the up and down movements move by "display/screen lines":
"     map j      gj
      map <Down> gj
"     map k      gk
      map <Up>   gk


vmap <Space> :
nmap <Space> :

noremap <Tab> :bn<CR>
" noremap `     :bp<CR>
" imap ` <ESC><C-L>

" noremap <Tab>	:tabn<CR>
" noremap <`>	:tabp<CR>

"nmap <M-p>  :tp<CR>
"nmap <M-n>  :tn<CR>

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" Quickly navigate between buffers/windows
  " map <C-J> <C-W>j
  " map <C-K> <C-W>k
  nmap <C-J> :bp<CR>
  nmap <C-K> :bn<CR>

" And <Ins> and <Del> can go through errors.
map <M-n> :cn<CR>
map <M-p> :cp<CR>

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" adjust window sizes
map - <C-W>-
map + <C-W>+
map < <C-W><
map > <C-W>>

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \t but some function keys (which won't work in all
" terminals) are also mapped.

" have <Leader>tf ("toggle format") toggle the automatic insertion of line breaks
" during typing and report the change:
" nnoremap <Leader>tf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
"   \ endif <Bar> set fo?<CR>
" nmap <F3> <Leader>tf
" imap <F3> <C-O><Leader>tf

set nonumber
set nocursorline
nnoremap <F2> :set number!<CR>:set cursorline!<CR>
inoremap <F2> <C-O>:set number!<CR>:set cursorline!<CR>

set spelllang=en,cjk
nnoremap <silent> <F3> :set spell!<cr>
inoremap <silent> <F3> <C-O>:set spell!<cr>

" 981210 Whenever I paste some text into VIM I have to
" toggle from "nopaste" to "paste" and back again:
" map <f4>   :set paste!<C-M>:set paste?<C-M>
" map <esc>[14~ :set paste!<C-M>:set paste?<C-M>
" --> new option for this:  'pastetoggle'
  set   pastetoggle=<F4>

map <silent><F4> :set nowrap!<cr>


" have <Leader>tl ("toggle list") toggle list on/off and report the change:
nnoremap <Leader>tl :set invlist list?<CR>

" have <Leader>th ("toggle highlight") toggle highlighting of search matches, and
" report the change:
" nnoremap <Leader>th :set invhls hls?<CR>
" nmap <F2> <Leader>th

" walk through installed colorschemes using arrow keys
map <silent><F10> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>

" don't leave highlighting on for ever, but turn back when a new search
" starts or the last one is repeated
"nnoremap <F7> :se nohls<cr>
"nnoremap <CR> :nohlearch<CR>/<BS><CR>
"nnoremap <CR> :nohlsearch<CR><CR>
"noremap <C-L> :nohl<cr><C-L>
nnoremap n :set hls<CR>n
nnoremap N :set hls<CR>N
nnoremap * :set hls<CR>*
nnoremap # :set hls<CR>#
nnoremap / :set hls<CR>/
nnoremap ? :set hls<CR>?

" kernel tests
nnoremap <Leader>kc :%s/^> //<CR>
			\:%s/^Subject: Re:/Subject:/<CR>
			\:%g/^On .* wrote:$/d<CR>

nnoremap <Leader>kt :/^Reply-To/;/^TO: /-1d<CR>
                        \:g/\(^\/c\/kernel-tests\/\\|^grep \\|^rsync \\|^mv \\|^ssh \\|^less \\|^git checkout \\|^git remote \\|^______ [A-Z ]* ______$\\|^:::::: \)/d<CR>
			\:1s/From: .*/From: Fengguang Wu <fengguang.wu@intel.com>/<CR>
			\:2,3s/^\(To\\|Cc\):/Bcc:/<CR><CR>

" nnoremap <Leader>kt :2;?^0-DAY ?g/\(\/kernel-tests\/\\|^grep \\|^rsync \\|^mv \\|^ssh \\|^less \\|^git checkout \\|^git remote \\|^______ [A-Z ]* ______$\\|^:::::: \)/d<CR>
" \:%s/\n*\(\nTO: \)/\1/<CR>
":2,3s/To: kbuild@01.org/CC: kbuild@01.org/<CR><CR>

nnoremap <Leader>kp :2;?^0-DAY ?g/\(^To: .*intel.com$\\|\/kernel-tests\/\\|^rsync \\|^ssh \\|^less \\|^git checkout \\|^git remote \\|^______ [A-Z ]* ______$\\|^:::::: \)/d<CR>:%s/\n*\(\nTO: \)/\1/<CR>:1s/From: .*/From: Peter Hüwe <PeterHuewe@gmx.de>/<CR>:2s/To:.*\n//<CR><CR>

nnoremap <Leader>kb :1s/^From: .*/From: Fengguang Wu <fengguang.wu@intel.com>/<CR>
			\:3/^$/,/^\(TO\\|CC\): /-1d<CR>
			\:2/^User-Agent: /d<CR>
			\:%g/^::::::/d<CR>
			\:2,12g/eclists.intel.com/d<CR>
			\:2,12g/^Reply-To: /d<CR>
			\:2,3/^To: Fengguang Wu <fengguang.wu@intel.com>/d<CR>
                        \:2,9s/^Subject: \[lkp] /Subject: /<CR>

                        " \:2/^To: .*LKP /d<CR>
                        " \:2,9s/^Subject: .*[0-9]\.[0-9]\+]/Subject: []/<CR>f]i

			" \:2,9s/^Subject: \[LKP] /Subject: /<CR>
			" \:2/^Sender:/d<CR>

nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>o :Sex<CR>


" map F9 to switch on and off syntax highlighting
function Swapcolor()
	if exists("g:syntax_on")
		syntax off
		set nohlsearch
	else
		syntax on
		set hlsearch
	endif
endfunction

" map <F9> :call Swapcolor()<CR>

" nmap <F8> :TagbarToggle<CR>

" 001201:  Deleting text in normal mode
" using the BackSpace and Delete keys:
" nmap <BS>  X
  nmap <DEL> x


" most of these are for refactoring

autocmd FileType c,cpp vmap <Leader>if >g'<Oif () {<ESC>g'>o}<ESC>g'<ta
autocmd FileType c,cpp vmap <Leader>for >g'<Ofor (;;) {<ESC>g'>o}<ESC>g'<tna
autocmd FileType c,cpp vmap <Leader>whi >g'<Owhile () {<ESC>g'>o}<ESC>g'<t3na
autocmd FileType c,cpp vmap <Leader>do >g'<Odo {<ESC>g'>o} while ();<ESC>2da
" Microsoft calls these 'regions'.  Who am I to disagree?
autocmd FileType c,cpp vmap <Leader>reg >g'<O<ESC>0i// {{{ <ESC>g'>o<ESC>0i// }}}<ESC>g'<t$a


" Search for selected text in visual mode with */#
" effect: overrides unnamed register
" Simplest version: vnoremap * y/<C-R>"<CR>
" Better one: vnoremap * y/\V<C-R>=escape(@@,"/\\")<CR><CR>
" This is so far the best, allowing all selected characters and multiline selection:

" Atom \V sets following pattern to "very nomagic", i.e. only the backslash has special meaning.
" As a search pattern we insert an expression (= register) that
" calls the 'escape()' function on the unnamed register content '@@',
" and escapes the backslash and the character that still has a special
" meaning in the search command (/|?, respectively).
" This works well even with <Tab> (no need to change ^I into \t),
" but not with a linebreak, which must be changed from ^M to \n.
" This is done with the substitute() function.
vnoremap * y/\V<C-R>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<CR><CR>
vnoremap # y?\V<C-R>=substitute(escape(@@,"?\\"),"\n","\\\\n","ge")<CR><CR>


" ,mc and ,xc always generate the correct comments for many languages,
" including C, C++, HTML, Java, lex, yacc, shell scripts, Perl, etc.
" The default key binding is to generate shell comments using a pound sign (file glob of * at the start).
autocmd Bufread * nmap <Leader>mc !!boxes -d pound-cmt<CR>
autocmd Bufread * vmap <Leader>mc !boxes -d pound-cmt<CR>
autocmd Bufread * nmap <Leader>xc !!boxes -d pound-cmt -r<CR>
autocmd Bufread * vmap <Leader>xc !boxes -d pound-cmt -r<CR>
autocmd Bufread *.html,*.xml nmap <Leader>mc !!boxes -d html-cmt<CR>
autocmd Bufread *.html,*.xml vmap <Leader>mc !boxes -d html-cmt<CR>
autocmd Bufread *.html,*.xml nmap <Leader>xc !!boxes -d html-cmt -r<CR>
autocmd Bufread *.html,*.xml vmap <Leader>xc !boxes -d html-cmt -r<CR>
autocmd Bufread *.[chly],*.[pc]c nmap <Leader>mc !!boxes -d c-cmt2<CR>
autocmd Bufread *.[chly],*.[pc]c vmap <Leader>mc !boxes -d c-cmt2<CR>
autocmd Bufread *.[chly],*.[pc]c nmap <Leader>xc !!boxes -d c-cmt2 -r<CR>
autocmd Bufread *.[chly],*.[pc]c vmap <Leader>xc !boxes -d c-cmt2 -r<CR>
autocmd Bufread *.C,*.cpp,*.java nmap <Leader>mc !!boxes -d java-cmt<CR>
autocmd Bufread *.C,*.cpp,*.java vmap <Leader>mc !boxes -d java-cmt<CR>
autocmd Bufread *.C,*.cpp,*.java nmap <Leader>xc !!boxes -d java-cmt -r<CR>
autocmd Bufread *.C,*.cpp,*.java vmap <Leader>xc !boxes -d java-cmt -r<CR>
autocmd Bufread *.vim,*.vimrc nmap <Leader>mc !!boxes -d vim-cmt<CR>
autocmd Bufread *.vim,*.vimrc vmap <Leader>mc !boxes -d vim-cmt<CR>
autocmd Bufread *.vim,*.vimrc nmap <Leader>xc !!boxes -d vim-cmt -r<CR>
autocmd Bufread *.vim,*.vimrc vmap <Leader>xc !boxes -d vim-cmt -r<CR>

" au FileType haskell,vhdl,ada            let b:comment_leader = '-- '
" au FileType vim                         let b:comment_leader = '" '
" au FileType c,cpp,java                  let b:comment_leader = '// '
" au FileType sh,make                     let b:comment_leader = '# '
" au FileType tex                         let b:comment_leader = '% '
" noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
" noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

let g:EnhCommentifyTraditionalMode = 'Yes'
let g:EnhCommentifyUseAltKeys = 'Yes'
let g:EnhCommentifyBindInInser = 'Yes'
let g:EnhCommentifyBindInVisual = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyAlignRight = 'Yes'
let g:EnhCommentifyUseBlockIndent = 'Yes'
let g:EnhCommentifyMultiPartBlocks = 'Yes'

"map <Char-033>c <M-c>
"imap <Char-033>c <M-c>
"imap <Char-033>x <M-x>
"imap <Char-033>v <M-v>
"imap <Char-033>y <M-y>

" vim console need this, rather awkward
autocmd Bufread * map c <M-c>
autocmd Bufread * imap c <M-c>
" autocmd Bufread * map x <M-x>
" autocmd Bufread * imap x <M-x>

" nmap <M-c> <Plug>NERDCommenterInvert

"noremap ' `
"noremap ` '

nmap <S-Right>          <C-]>
nmap <S-Left>           <C-T>
nmap <S-Up>             :tp<CR>
nmap <S-Down>           :tn<CR>

" Emacs style editing
imap <C-A>  <C-O>0
imap <C-E>  <C-O>$
imap <C-F> <Right>
imap <C-B> <Left>
imap <C-D> <Del>
imap <C-K> D
" imap <C-K> <Up>
" imap <C-J> <Down>

" imap h <Left>
" imap j <Down>
" imap k <Up>
" imap l <Right>

" imap f w
" imap b b
" imap d dw
" imap D D
" imap a <Home>
" imap e <End>

" Find a buffer with the given number (ordering is such that the first
" entry shown in minibufexpl is 1, the second is 2 and so on). If
" there's already a window open for that buffer, switch to it. Otherwise
" switch the current window to use that buffer.
fun! <SID>SelectBuffer(wantedbufnum)
    let l:buflast = bufnr("$")
    let l:bufidx = 0
    let l:goodbufcount = 0
    while (l:bufidx < l:buflast)
        let l:bufidx = l:bufidx + 1
        if buflisted(l:bufidx)
            let l:bufname = bufname(l:bufidx)
            if (strlen(l:bufname)) &&
                        \ getbufvar(l:bufidx, "&modifiable") == 1 &&
                        \ l:bufname != '-MiniBufExplorer-'
                let l:goodbufcount = l:goodbufcount + 1
                if l:goodbufcount == a:wantedbufnum
                    let l:winnr = bufwinnr(l:bufidx)
                    if l:winnr > -1
                        execute l:winnr . "wincmd w"
                    else
                        execute "buffer " . l:bufidx
                    endif
                    break
                endif
            endif
        endif
    endwhile
endfun

" Buffer switches
nmap   <silent> <C-1>   :call <SID>SelectBuffer( 1)<CR>
nmap   <silent> <C-2>   :call <SID>SelectBuffer( 2)<CR>
nmap   <silent> <C-3>   :call <SID>SelectBuffer( 3)<CR>
nmap   <silent> <C-4>   :call <SID>SelectBuffer( 4)<CR>
nmap   <silent> <C-5>   :call <SID>SelectBuffer( 5)<CR>
nmap   <silent> <C-6>   :call <SID>SelectBuffer( 6)<CR>
nmap   <silent> <C-7>   :call <SID>SelectBuffer( 7)<CR>
nmap   <silent> <C-8>   :call <SID>SelectBuffer( 8)<CR>
nmap   <silent> <C-9>   :call <SID>SelectBuffer( 9)<CR>
nmap   <silent> <C-0>   :call <SID>SelectBuffer(10)<CR>

map	q<CR>	:qa<CR>

" Annoying default mappings
"inoremap <S-Up>   <C-o>gk
"inoremap <S-Down> <C-o>gj
"noremap  <S-Up>   gk
"noremap  <S-Down> gj

nmap <silent> ,/ :nohlsearch<CR>

" forgot to sudo before editing a file that requires root privileges?
cmap w!! w !sudo tee % >/dev/null

function! Carousel()
  for theme in split(globpath(&runtimepath, 'colors/*.vim'), '\n')
    let t = fnamemodify(theme, ':t:r')
    try
      execute 'colorscheme '.t
      echo t
    catch
    finally
    endtry
    sleep 4
    redraw
  endfor
endfunction

map <silent> <Leader>tc :call Carousel()<cr>

" https://github.com/Shougo/neocomplete.vim/issues/473
" inoremap <c-y> <c-o>:NeoCompleteLock<CR><c-y>
" <c-o>:NeoCompleteUnlock<CR>

" ,t ,b ,j already mapped to Command-T
" noremap <leader>o <Esc>:CommandT<CR>
