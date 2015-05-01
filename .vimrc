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
" Set advanced status line
set laststatus=2                             " always show statusbar
set statusline=
set statusline+=%-10.3n\                     " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

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
au BufRead,BufNewFile *.thor setfiletype ruby
au BufRead,BufNewFile Guardfile setfiletype ruby
au BufRead,BufNewFile *.module setfiletype php
au BufRead,BufNewFile *.install setfiletype php

" Take care of eol
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

" Git-related aliasesG
command Greset Git reset --hard HEAD
command Gst Gstatus
command Gbranch Git branch
command Gbranches Git branch -vva
command Gurl echomsg system("git config --get remote.origin.url")[:-2]
"command Gpull echomsg system("git pull --rebase | tail -1")[:-2]
command Gdlog Git log --graph --stat --all --decorate
command Gglog Git log --stat
command Gclean Git clean -f -d
command Gc Gclean
command Gstash Git stash
command Gfetch Git fetch
command Gamend Git commit --amend --no-edit
command Grebuild Git commit -m 'Rebuild' --allow-empty
function! s:GTrack(args)
  :execute "Git branch -u " . a:args
endfunction
command! -nargs=1 Gtrack call s:GTrack(<f-args>)
command Gtags Git tag -l -n1
command Gcotag echomsg system("git name-rev --tags --name-only $(git rev-parse HEAD)")[:-2]
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
function! s:Gpr(args)
  :echomsg "Checking out Pull Request #" . a:args . "..."
  :call system("git fetch origin pull/" . a:args . "/head:pr/" . a:args . " && git checkout pr/" . a:args)
  :echomsg "Checked out Pull Request #" . a:args
  " TODO skip need for Enter
endfunction
command! -nargs=1 Gpr call s:Gpr(<f-args>)

" PHP-related aliases
function! s:Composer(args)
  :execute "! composer " . a:args
endfunction
command! -nargs=1 Composer call s:Composer(<f-args>)

" Rails-related aliases
" Requires vim-capistrano
command Cstage Cap staging deploy
command Clive Cap production deploy

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
  " TODO remove when https://github.com/bower/bower/pull/1617 is merged
  :let path = !glob(".bowerrc") ? 'bower_components' : 'bower_components'
  :execute "! rm -rvf " . path . "; bower --verbose cache clean; bower --verbose install;"
endfunction
command! -nargs=0 Breset call s:BReset()

" Utilities
command Tstamp r! date +\%s
command Md5 ! md5 %

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp plugin for quick buffer navigation
let g:ctrlp_map = '<c-p>'

" mustache
let g:mustache_abbreviations = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Advanced status bar and tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1