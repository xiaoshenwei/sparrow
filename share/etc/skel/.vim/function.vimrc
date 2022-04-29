"let TE_Adjust_Winwidth = 0
"let TE_Ctags_Path = '/usr/bin/ctags-exuberant'


function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-P>"
endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

"put this in a file and source it
function AllBuffers(cmnd)
  let cmnd = a:cmnd
  let i = 1
  while (i <= bufnr("$"))
    if bufexists(i)
      execute "buffer" i
      execute cmnd
    endif
    let i = i+1
  endwhile
endfun
":call AllBuffers("%s/foo/bar/ge|update")


augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |        
    \   endif |
    \ endif
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END

function! BytePercent()
let CurByte = line2byte (line ( "." ) ) + col ( "." ) - 1
let TotBytes = line2byte( line( "$" ) + 1) - 1
return ( CurByte * 100 ) / TotBytes
endfunction

command! -nargs=0 -bar HowFar echo "Byte " . ( line2byte( line( "." ) ) + col( "." ) - 1 ) . " of " . ( line2byte( line( "$" ) + 1 ) - 1 ) . " (" . BytePercent() . "%)"

cnoreabbrev HF HowFar

fu ShowTab()
   let TabLevel = (indent('.') / &ts )
   if TabLevel == 0
      let TabLevel='*'
   endif
   return TabLevel
endf
