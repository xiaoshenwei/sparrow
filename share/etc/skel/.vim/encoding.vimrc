if version > 603 
        set helplang=cn
endif

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,latin1
if $LANG == "zh_CN.GBK" || $LC_ALL == "zh_CN.GBK"
	set termencoding=gbk
elseif $LANG == "zh_CN.GB2312" || $LC_ALL == "zh_CN.GB2312"
	set termencoding=gb2312
endif

" set langmenu=en
" set guifontwide=SimSun\ 12
" if version > 603 
	" source $VIMRUNTIME/delmenu.vim
	" source $VIMRUNTIME/menu.vim
" endif

" set charconvert=CharConvert()
" if 1
"         fun CharConvert()  
"           echo "iconv from " . v:charconvert_from . " to " . v:charconvert_to . ' < ' . v:fname_in . ' > ' v:fname_out 
"           let cmd="/usr/bin/iconv -f " . v:charconvert_from . " -t " . v:charconvert_to . ' < ' . v:fname_in . ' > ' v:fname_out
"           echo system(cmd)
"           return v:shell_error
"         endfun
" else
"         fun CharConvert()
"           echo "recode from " . v:charconvert_from . " to " . v:charconvert_to
"           system("recode "
"                 \ . v:charconvert_from . ".." . v:charconvert_to
"                 \ . " <" . v:fname_in . " >" v:fname_out)
"           return v:shell_error
"         endfun
" endif

