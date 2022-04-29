if filereadable("/etc/vim/vimrc")
  source /etc/vim/vimrc
endif

" reading from stdin from tmux
if &loadplugins == 0
	augroup stdin
		autocmd StdinReadPost * setlocal buftype=nofile bufhidden=hide noswapfile
	augroup END

	runtime macros/less.vim

	finish
endif

" if !empty(glob("~/.vim/bundle"))
	" execute pathogen#infect()
" endif

if filereadable($HOME . "/.vim/vim-plug.vim")
	source ~/.vim/vim-plug.vim
endif

source ~/.vim/option.vimrc
source ~/.vim/function.vimrc
source ~/.vim/key.vimrc

source ~/.vim/encoding.vimrc
source ~/.vim/filetype.vimrc
source ~/.vim/abbr.vimrc
source ~/.vim/abbr-aliases.vimrc

"source ~/.vim/gpgfiles.vimrc
"source ~/.vim/mlsetting.vimrc

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
        source $VIMRUNTIME/macros/matchit.vim
endif

" if filereadable($VIMRUNTIME . "/ftplugin/man.vim")
	" source $VIMRUNTIME/ftplugin/man.vim
" endif

" if &term == "screen"
" 	runtime macros/screenpaste.vim
" endif

if filereadable($HOME . "/.vim/personal.vimrc")
	source $HOME/.vim/personal.vimrc
endif

source ~/.vim/color.vimrc
source ~/.vim/paste.vimrc

source ~/.vim/signature.vimrc

" WFG: this cannot work on urxvt/tmux
if filereadable($HOME . "/.vim/plugin/osc52.vim")
	source ~/.vim/plugin/osc52.vim
	vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
endif
