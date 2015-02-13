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
set noswapfile
set foldmethod=indent
set foldminlines=5

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

" Git-related aliasesG
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
command Gpushf Git push -f origin HEAD
command Gpull Git pull --rebase origin HEAD
command Gdlog Git log --graph --stat --all --decorate
command Gglog Git log --stat
command Gclean Git clean -f -d
command Gc Gclean
command Gstash Git stash
command Gfetch Git fetch
command Gamend Git commit --amend --no-edit
function! s:GTrack(args)
  :execute "Git branch -u " . a:args
endfunction
command! -nargs=1 Gtrack call s:GTrack(<f-args>)
command Gtags Git tag -l -n1
command Gcotag Git name-rev --tags --name-only $(git rev-parse HEAD)
command Ghead Git checkout head -- %
command Gflog Git log -p %
function! s:Gcof(args)
  :execute "Git checkout " . a:args . " -- %"
endfunction
command! -nargs=1 Gcof call s:Gcof(<f-args>)
function! s:Gmsg(args)
  :execute "Git commit --amend -m " . a:args
endfunction
command! -nargs=1 Gmsg call s:Gmsg(<f-args>)

" PHP-related aliases
function! s:Composer(args)
  :execute "! composer " . a:args
endfunction
command! -nargs=1 Composer call s:Composer(<f-args>)

" Rails-related aliases
function! s:Rvm(args)
  :execute "! rvm " . a:args
endfunction
command! -nargs=1 Rvm call s:Rvm(<f-args>)
function! s:Cap(args)
  :execute "! cap " . a:args
endfunction
command! -nargs=1 Cap call s:Cap(<f-args>)
command Cstage ! cap staging deploy
command Clive ! cap production deploy

" Node and NPM-related aliases
function! s:Npm(args)
  :execute "! npm " . a:args
endfunction
command! -nargs=1 Npm call s:Npm(<f-args>)
command Nreset ! rm -rf node_modules; npm i
command Ntest ! npm test

" Bower
function! s:Bower(args)
  :execute "! bower " . a:args
endfunction
command! -nargs=1 Bower call s:Bower(<f-args>)
function! s:BReset()
  " TODO consider .bowerrc to fetch correct path
  :let path = !glob(".bowerrc") ? 'bower_components' : 'bower_components'
  :execute "! rm -rvf " . path . "; bower --verbose cache clean; bower --verbose install;"
endfunction
command! -nargs=0 Breset call s:BReset()

" Utilities
command Tstamp r! date +\%s
command Md5 ! md5 %

" Helper aliases
command W w
command Q q
command A a
command Qa qa
command QA qa
command Wq wq
command Bw bw
command Buffers buffers

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp plugin for quick buffer navigation
let g:ctrlp_map = '<c-p>'

" mustache
let g:mustache_abbreviations = 1