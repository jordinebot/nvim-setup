" -----------------------------------------------
" BASIC SETTINGS
" -----------------------------------------------

" Set nvim interface language to en_US
language en_US

" Enable syntax highlight with Monokai Theme
syntax enable
colorscheme monokai

" Show line numbers
set number

" Show command in bottom bar
set showcmd

" Highlight current line
set cursorline

" Tabs & Indent
set tabstop=4       " spaces per TAB
set shiftwidth=4    " spaces per TAB for autoindent
set softtabstop=4   " spaces per TAB when editing
set expandtab       " TAB with spaces
set autoindent
set copyindent      " copy indent from the previous line

" Make searching case insensitive
set ignorecase

" ... unless the query has capital letters.
set smartcase

" Autodetect file types on buffer opening and
" enable specific indentation and plugins
filetype plugin indent on

" Interface response time to changes in ms
set updatetime=250

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.


" -----------------------------------------------
" MY PLUGINS
" -----------------------------------------------

" Automatically install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Installed plugins
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()



" -----------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------

" Auto open NERDtree on enter vim
au VimEnter *  NERDTree /git/

let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall



" -----------------------------------------------
" MY KEYBINDINGS
" -----------------------------------------------

" Set <Leader> key
let mapleader=","

" Edit/reload vimrc
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :so $MYVIMRC<CR>

" better Esc
inoremap jj <Esc>

" Reindent
nnoremap <leader>r mzgg=G`z<CR>


" Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>


" -----------------------------------------------
" ADVANCED SETTINGS
" -----------------------------------------------

" Set paths for python
let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Highlight trailing whitespaces
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)

" Cancel a search with Esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>



" -----------------------------------------------
" AUTOMATIC ACTIONS
" -----------------------------------------------

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Automatically close parenthesis & quotes
" on Insert mode
inoremap ( ()<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap {<CR> {<CR>}<Esc>ko

" Wrappings in visual mode
vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap ) <Esc>`>a )<Esc>`<i( <Esc>
vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap ] <Esc>`>a ]<Esc>`<i[ <Esc>
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap " <Esc>`>a"<Esc>`<i"<Esc>



" -----------------------------------------------
" TEXT EDITING
" -----------------------------------------------

" Quick way to move lines of text up or down.

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi

" Visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv



" -----------------------------------------------
" BUFFER & SPLIT NAVIGATION
" -----------------------------------------------

" Allow hidden buffers (to switch without save first)
set hidden

" Fast switch to previous buffer
nnoremap <Leader><Leader> :e#<CR>

" List buffers
map <Leader>. :ls<CR>:b

" Fast Next / Previous buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Split navigation
nnoremap <A-h> <C-w><C-h>
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>

