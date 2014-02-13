set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

filetype on
filetype plugin on
filetype indent on
syntax on

set background=dark  "makes it easier to read with black backgroun:d
colorscheme railscasts "set theme in ./vim/colors folder
set ls=2            " allways show status line
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set ignorecase        "ignore case while searching
set number            "put numbers on side
set backspace=indent,eol,start

execute pathogen#infect()
syntax on
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40

filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

au BufWritePre * :%s/\s\+$//e " remove trailing whitespace
au VimEnter *  NERDTree " open NERDTree automatically

