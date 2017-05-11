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

" Autodetect file types on buffer opening and
" enable specific indentation and plugins
filetype plugin indent on


" MY KEYBINDINGS
" Set <Leader> to Space
let mapleader = " "


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


