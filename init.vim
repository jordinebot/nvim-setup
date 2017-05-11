" BASIC SETTINGS
" Set nvim interface language to en_US
language en_US

" Enable syntax highlight with Monokai Theme
" Requires ~/.config/nvim/colors/monokai.vim from
" https://github.com/sickill/vim-monokai
syntax enable
colorscheme monokai

" Show line numbers
set number

" Set tab size
set tabstop=4
set shiftwidth=4

" Autodetect file types on buffer opening and
" enable specific indentation and plugins
filetype plugin indent on

" Interface response time to changes in ms
set updatetime=250


" MY PLUGINS

" Automatically install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()


" MY KEYBINDINGS
" Set <Leader> to Space
let mapleader = " "

" Autoindent
map <Leader>i mzgg=G`z

" CUSTOM MOVEMENTS


" ADVANCED SETTINGS
" Highlight trailing whitespaces
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)


" AUTOMATIC ACTIONS
" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Automatically close parenthesis & quotes
" on Insert mode
inoremap ( ()<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Wrappings in visual mode
vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap ) <Esc>`>a )<Esc>`<i( <Esc>
vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap ] <Esc>`>a ]<Esc>`<i[ <Esc>
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap " <Esc>`>a"<Esc>`<i"<Esc>


" TEXT EDITING

" Quick way to move lines of text up or down.

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-k> <ESC>:m .-2<CR>==gi
inoremap <C-j> <ESC>:m .+1<CR>==gi

" Visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" BUFFER HANDLING
" Fast switch to previous buffer
nnoremap <Leader><Leader> :e#<CR>

" STATUSBAR CONFIGURATION

