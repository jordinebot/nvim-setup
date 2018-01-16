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

" Show ruler on columns 80 & 120
set colorcolumn=80,120

" Tabs & Indent
set tabstop=4       " spaces per TAB
set shiftwidth=4    " spaces per TAB for autoindent
set softtabstop=4   " spaces per TAB when editing
set expandtab       " TAB with spaces
set autoindent
set copyindent      " copy indent from the previous line
set nowrap          " By default, don't wrap long lines

" Folding
set foldmethod=indent
set foldnestmax=2

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

" Don't store backups or swap files since important files are
" always git tracked (also I save too often)
set nobackup
set noswapfile

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
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'stanangeloff/php.vim'
Plug 'mattn/webapi-vim' " https://github.com/mattn/emmet-vim/#adding-custom-snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'
Plug 'kchmck/vim-coffee-script'
Plug 'cloudhead/neovim-fuzzy'
Plug 'Numkil/ag.nvim'
Plug 'c0r73x/neotags.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'fatih/vim-go'
" Plug 'wakatime/vim-wakatime'
Plug 'posva/vim-vue'
" Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'terryma/vim-smooth-scroll'
" Plug 'roxma/nvim-completion-manager'
Plug 'jiangmiao/auto-pairs'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'mustache/vim-mustache-handlebars'

" Initialize plugin system
call plug#end()



" -----------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------
" Enable deoplete (for local autocompletion) on startup
let g:deoplete#enable_at_startup = 1

" Use NeoFormat on events...
" autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat

" Prettier settings
let g:prettier#config#tab_width = 4

" Hide some files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules', '.git$', 'tmp$', '.DS_Store']

" Use another Emmet Leader key
let g:user_emmet_leader_key=','
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets/my_snippets.json')), "\n"))

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Colorize HEX, RGB, RGBA codes on some filestypes
let g:colorizer_auto_filetype='css,scss'

" Use fzy as CtrlP
nnoremap <C-p> :FuzzyOpen<CR>

" Smooth Scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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
nnoremap <leader>i mzgg=G`z<CR>

" Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>

" Save on leaving Insert mode
inoremap <Esc> <Esc>:w<CR>

" Close current buffer without losing split
" http://stackoverflow.com/a/4468491/1534704
nnoremap <C-c> :bp\|bd #<CR>

" Abbreviations
cnoreabbrev vr vertical resize
cnoreabbrev ag Ag
cnoreabbrev W w

" Folding
nnoremap <Space> za
vnoremap <Space> za

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

" Replace all occurrences of word under cursor in the whole file
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Disable Ex Mode
" https://vi.stackexchange.com/a/2692/11899
nnoremap Q <Nop>

" -----------------------------------------------
" AUTOMATIC ACTIONS
" -----------------------------------------------

" Remove trailing spaces on save
" autocmd BufWritePre * :%s/\s\+$//e
" Remove trailing spaces on save except for some filestypes
" https://stackoverflow.com/a/10410590/1534704
let exceptions = ['markdown']
autocmd BufWritePre * if index(exceptions, &ft) < 0 | :%s/\s\+$//e


" Wrap .md files to 120 cols
au BufRead,BufNewFile *.md setlocal textwidth=120
au BufRead,BufNewFile *.md setlocal formatoptions+=t


" -----------------------------------------------
" TEXT EDITING
" -----------------------------------------------

" Quick way to move lines of text up or down.

" Normal mode
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

" Insert mode
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi

" Visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" -----------------------------------------------
" BUFFER & SPLIT NAVIGATION
" -----------------------------------------------

" Allow hidden buffers (to switch without save first)
set hidden

" Fast switch to previous buffer
" Trying , as Emmet's Leader. Also this can be achieved with <S-Tab> too.
" nnoremap <Leader><Leader> :e#<CR>

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

" Split navigation with direction arrows
" faster than A-* and it forces me to navigate
" text with hjkl.
map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

" Increase and decrease vertical splits width
nnoremap <A-+> :vertical resize +10<CR>
nnoremap <A--> :vertical resize -10<CR>

" -----------------------------------------------
"  SPECIAL SETTINGS
" -----------------------------------------------

" Put at the very end of your .vimrc file.
" http://vimawesome.com/plugin/php-vim-shouldve-said-no
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
