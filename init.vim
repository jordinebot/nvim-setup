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
set tabstop=2       " spaces per TAB
set shiftwidth=2    " spaces per TAB for autoindent
set softtabstop=2   " spaces per TAB when editing
set expandtab       " TAB with spaces
set autoindent
set copyindent      " copy indent from the previous line
set nowrap          " By default, don't wrap long lines



" Folding
set foldmethod=indent
set foldnestmax=4
set nofoldenable

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
Plug 'airblade/vim-gitgutter'
Plug 'cakebaker/scss-syntax.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'chrisbra/Colorizer'
Plug 'cloudhead/neovim-fuzzy'
Plug 'crusoexia/vim-javascript-lib'
Plug 'honza/vim-snippets'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/calendar-vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim' " https://github.com/mattn/emmet-vim/#adding-custom-snippets
Plug 'mustache/vim-mustache-handlebars'
Plug 'Numkil/ag.nvim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'vue'] }
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
Plug 'stanangeloff/php.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" -----------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------
" Enable deoplete (for local autocompletion) on startup
let g:deoplete#enable_at_startup = 1

" Prettier settings
let g:prettier#config#tab_width = 2

" Hide some files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules', '.git$', 'tmp$', '.DS_Store']

" Use another Emmet Leader key
let g:user_emmet_leader_key=','

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Colorize HEX, RGB, RGBA codes on some filestypes
let g:colorizer_auto_filetype='css,scss,less'

" Use fzy as CtrlP
nnoremap <C-p> :FuzzyOpen<CR>

" Ultisnips
let g:UltiSnipsSnippetsDir='~/.config/nvim/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

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
" Currently disabled for caution on YourDictionary.com
" inoremap <Esc> <Esc>:w<CR>

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Sort inside brackets
nnoremap siB :?{?+,/}/-sort<CR>
nnoremap si{ :?{?+,/}/-sort<CR>
nnoremap si( :?(?+,/)/-sort<CR>

" Enable/Disable spell check for current buffer
nnoremap <leader>o :setlocal spell spelllang=en_us<CR>
nnoremap <leader>O :setlocal nospell<CR>
" ]s next, [s previous, z= suggestions, zg add word


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

" Remove trailing spaces on save except for some filestypes
" https://stackoverflow.com/a/10410590/1534704
let exceptions = ['markdown']
autocmd BufWritePre * if index(exceptions, &ft) < 0 | :%s/\s\+$//e


" Wrap .md files to 120 cols
au BufRead,BufNewFile *.md,*.wiki setlocal textwidth=120
au BufRead,BufNewFile *.md,*.wiki setlocal formatoptions+=t

" Prevent broken syntax highlighting on Vue SFC
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
autocmd FileType vue syntax sync fromstart

" Trigger autoread when changing buffers or coming back to vim.
" Useful after `git checkout --` on external terminal.
au FocusGained,BufEnter * :silent! !

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
