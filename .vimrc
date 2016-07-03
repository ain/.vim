set shell=/opt/local/bin/bash
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
set background=dark            " makes it easier to read with black backgroun:d
colorscheme railscasts         " set theme in ./vim/colors folder
set hlsearch                   " highlight searches
set incsearch                  " do incremental searching
set ruler                      " show the cursor position all the time
set visualbell t_vb=           " turn off error beep/flash
set ignorecase                 " ignore case while searching
set number                     " put numbers on side
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

au BufWritePre * :%s/\s\+$//e        " remove trailing whitespace
au VimEnter * NERDTree | wincmd p    " open NERDTree automatically, focus on file buffer

" Associate uncommon filetypes
au BufRead,BufNewFile Guardfile setfiletype ruby
au BufRead,BufNewFile *.module setfiletype php
au BufRead,BufNewFile *.install setfiletype php
au BufRead,BufNewFile *.md setfiletype markdown
au BufRead,BufNewFile .rspec setfiletype eruby

" Git-related aliases
command Greset Git reset --hard HEAD
command Gst Gstatus
command Gbranch Git branch
command Gbranches Git branch -vva
command Grmbranches Git branch | grep -v master | sed 's/^[ *]*//' | sed 's/^/git branch -d /' | bash
command Grmrbranches Git branch -r | grep origin/ | grep -v master | grep -v HEAD| cut -d/ -f2 | while read line; do git push origin :$line; done;
command Gurl echomsg system("git config --get remote.origin.url")[:-2]
command Gpullo Git pull --rebase origin $(git symbolic-ref --short HEAD)
command Gpullu Git pull --rebase upstream $(git symbolic-ref --short HEAD)
command Gpusho Git push -u origin $(git symbolic-ref --short HEAD)
command Gpushu Git push upstream $(git symbolic-ref --short HEAD)
command Gpushf Git push -f
command Gpushfu Git push -f upstream $(git symbolic-ref --short HEAD)
command Gdlog Git log --graph --stat --all --decorate
command Gglog Git log --stat
command Gblog Git log --stat --decorate $(git symbolic-ref --short HEAD)
command Gflog Git log -p %
command Gclean Git clean -f -d
command Gc Gclean
command Gstash Git stash
command Gamend Git commit --amend --no-edit
command Grebuild Git commit -m 'Rebuild' --allow-empty
command Gtags Git tag -l -n1
command Gcotag echomsg system("git name-rev --tags --name-only $(git rev-parse HEAD)")[:-2]
command Gmsg Gcommit --amend
function! s:Gcof(args)
  execute "Git checkout " . a:args . " -- %"
endfunction
command! -nargs=1 Gcof call s:Gcof(<f-args>)
function! s:Gpr(remote, pr)
  " TODO argument validation
  echomsg "Checking out Pull Request #" . a:pr . " from " . a:remote . "..."
  call system("git fetch " . a:remote . " pull/" . a:pr . "/head:pr/" . a:pr . " && git checkout pr/" . a:pr)
  echomsg "Checked out Pull Request #" . a:pr . " from " . a:remote
  " TODO skip need for Enter
endfunction
command! -nargs=* Gpr call s:Gpr(<f-args>)
function! s:Gbranchd(args)
  " TODO validate branch name and existence
  echomsg "Deleting " . a:args
  call system("git branch -D " . a:args . " && git push origin :" . a:args)
  echomsg "Deletion complete"
endfunction
command! -nargs=1 Gbranchd call s:Gbranchd(<f-args>)

" Rails-related aliases
" Requires vim-capistrano
command Cstage Cap staging deploy
command Clive Cap production deploy

" Utilities
command Tstamp :execute ":normal i" . system("date +\%s")[:-2]
command Pwd :execute ":normal i" . system("pwgen -c1y 12")
command Md5 :echomsg system("md5 " . expand("%"))[:-2]

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp plugin for quick buffer navigation
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" mustache
let g:mustache_abbreviations = 1

" Tagbar
"nmap <F8> :TagbarToggle<CR>

" Advanced status bar and tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1

" Syntastic JavaScript check with JSCS
let g:syntastic_javascript_checkers=['jscs']
