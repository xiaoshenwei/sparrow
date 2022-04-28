" Vim color file
" Maintainer: Wu Fengguang
" Last Change: 2006-04-06
" Version: 0.1
" URL: 
" Based on oceanlight by <hakan@wikstrom.st>


""" Init
set background=light
highlight clear
highlight Normal        cterm=None ctermbg=231	 ctermfg=240
highlight Normal        cterm=None ctermbg=231	 ctermfg=240
highlight Normal        cterm=None ctermbg=231	 ctermfg=240
highlight Normal        cterm=None ctermbg=231	 ctermfg=240
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "oceanlight"


""""""""\ Colors \""""""""


"""" GUI Colors

highlight Cursor        cterm=None ctermbg=116	 ctermfg=15
highlight CursorIM cterm=none ctermfg=15	 ctermbg=116
highlight Directory     ctermfg=29	 ctermbg=bg
highlight DiffAdd cterm=None ctermfg=67	 ctermbg=252
highlight DiffChange cterm=None ctermfg=fg	 ctermbg=73
highlight DiffDelete cterm=None ctermfg=252	 ctermbg=67
highlight DiffText cterm=none ctermfg=fg	 ctermbg=bg
highlight ErrorMsg      cterm=bold ctermfg=red	  ctermbg=bg
highlight VertSplit    cterm=NONE ctermfg=0	 ctermbg=246
highlight Folded        cterm=none ctermbg=152	 ctermfg=67
highlight FoldColumn        cterm=none ctermbg=152	 ctermfg=67
highlight IncSearch cterm=reverse ctermfg=fg	 ctermbg=bg
highlight LineNr        cterm=none ctermbg=252	 ctermfg=72
highlight ModeMsg       ctermbg=73	 ctermfg=252
highlight MoreMsg       cterm=none  ctermfg=73	 ctermbg=bg
if version < 600
    " same as SpecialKey
    highlight NonText       ctermbg=252	 ctermfg=240
else
    " Bottom fill (use e.g. same as LineNr)
    highlight NonText       cterm=None ctermbg=252	 ctermfg=72
endif
highlight Question      cterm=none  ctermfg=84	 ctermbg=bg
highlight Search        cterm=NONE ctermbg=153	 ctermfg=none
highlight SpecialKey    ctermbg=252	 ctermfg=73
highlight StatusLine    cterm=none ctermbg=66	 ctermfg=252
highlight StatusLineNC  cterm=NONE ctermbg=252	 ctermfg=66
highlight Title         cterm=none  ctermfg=171	 ctermbg=bg
highlight Visual        cterm=reverse ctermbg=66	 ctermfg=153
highlight VisualNOS     cterm=none,underline ctermfg=fg	 ctermbg=bg
highlight WarningMsg    cterm=none ctermfg=203	 ctermbg=bg
highlight WildMenu      cterm=none ctermbg=118	 ctermfg=0


"""" Syntax Colors

"highlight Comment       cterm=reverse ctermfg=60
highlight Comment       cterm=bold ctermfg=32

highlight Constant      ctermfg=60	 ctermbg=bg
hi String cterm=underline ctermfg=69	 ctermbg=bg
    "hi Character cterm=None ctermfg=14	 ctermbg=bg
    highlight Number cterm=None ctermfg=71	 ctermbg=bg
    highlight Boolean cterm=none ctermfg=108	 ctermbg=bg
    "hi Float cterm=None ctermfg=14	 ctermbg=bg

highlight Identifier    ctermfg=69
hi Function cterm=bold ctermfg=108	 ctermbg=bg

highlight Statement     cterm=bold ctermfg=23
    highlight Conditional cterm=bold ctermfg=72	 ctermbg=bg
    highlight Repeat cterm=bold ctermfg=72	 ctermbg=bg
    hi Label cterm=None ctermfg=22	 ctermbg=bg
    highlight Operator cterm=None ctermfg=99	 ctermbg=bg
    highlight Keyword cterm=none ctermfg=4	 ctermbg=bg
    highlight Exception cterm=none ctermfg=29	 ctermbg=bg

highlight PreProc       ctermfg=117
hi Include cterm=bold ctermfg=94	 ctermbg=bg
hi Define cterm=bold ctermfg=88	 ctermbg=bg
hi Macro cterm=bold ctermfg=88	 ctermbg=bg
hi PreCondit cterm=bold ctermfg=130	 ctermbg=bg

highlight Type          cterm=NONE ctermfg=67
hi StorageClass cterm=None ctermfg=67	 ctermbg=bg
hi Structure cterm=None ctermfg=67	 ctermbg=bg
hi Typedef cterm=None ctermfg=67	 ctermbg=bg

highlight Special       cterm=none ctermfg=79
    "hi SpecialChar cterm=none ctermfg=15	 ctermbg=bg
    "hi Tag cterm=none ctermfg=15	 ctermbg=bg
    "hi Delimiter cterm=none ctermfg=15	 ctermbg=bg
    "hi SpecialComment cterm=none ctermfg=15	 ctermbg=bg
    "hi Debug cterm=none ctermfg=15	 ctermbg=bg

highlight Underlined cterm=underline ctermfg=102	 ctermbg=bg

highlight Ignore    ctermfg=237

highlight Error      ctermfg=124	 cterm=Bold  ctermbg=bg

highlight Todo          ctermfg=117	 ctermbg=66
