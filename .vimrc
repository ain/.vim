set smartindent
set encoding=utf-8
set textwidth=0
set wrapmargin=0
set tw=0
set wm=0
set syn=sh
set nobomb
set tabstop=2
set shiftwidth=2
set expandtab
set formatoptions=cq
set background=dark  "makes it easier to read with black backgroun:d
colorscheme railscasts "set theme in ./vim/colors folder
set ls=2            " always show status line
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set ignorecase        "ignore case while searching
set number            "put numbers on side
set backspace=indent,eol,start
set hidden
set backupdir=$TEMP,$TMP,.

execute pathogen#infect()
syntax on
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

let mapleader="," " Map <Leader> to ,

au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

au BufWritePre * :%s/\s\+$//e " remove trailing whitespace
au VimEnter *  NERDTree " open NERDTree automatically

" Associate uncommon filetypes
au BufRead,BufNewFile *.rake setfiletype ruby
au BufRead,BufNewFile *.module setfiletype php
au BufRead,BufNewFile *.install setfiletype php

" Take care of eol
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

" Git-related aliases
command Greset Git reset --hard HEAD
command Gst Gstatus
command Gbranch Git branch -vva
command Gurl Git config --get remote.origin.url
"function! s:GPush(args)
  ":let name = redir("git rev-parse --symbolic-full-name --abbrev-ref calculator-core-133@{u} | cut -d'/' -f 1")
  ":echo name
  ":execute "Git push " . name .
"endfunction
"command! -nargs=1 Gpush call s:GPush(<f-args>)
command Gpush Git push origin HEAD
command Gpull Git pull --rebase origin HEAD
command Gdlog Git log --graph --stat --all --decorate
command Gglog Git log --stat
command Gclean Git clean -f -d
command Gstash Git stash
command Gfetch Git fetch
function! s:GTrack(args)
  :execute "Git branch -u " . a:args
endfunction
command! -nargs=1 Gtrack call s:GTrack(<f-args>)

" Rails-related aliases
command Cstage ! cap staging deploy
command Clive ! cap production deploy

" Bower
function! s:Bower(args)
  :execute "! bower " . a:args
endfunction
command! -nargs=1 Bower call s:Bower(<f-args>)

" Helper aliases
command W w
command Q q
command A a
command Qa qa
command QA qa
command Wq wq

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp plugin for quick buffer navigation
let g:ctrlp_map = '<c-p>'

" mustache
let g:mustache_abbreviations = 1