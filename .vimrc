set background=dark
set rtp+=~/.vim/bundle/vim-hybrid
colorscheme hybrid
" Make Vim more useful
set nocompatible
set autoread
" ------------------------------------------------------------
" required
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" find files by ctrl-p shortcut
Plugin 'ctrlpvim/ctrlp.vim'
" highlight trailing whitespaces
Plugin 'ntpeters/vim-better-whitespace'
" awesome vim
Plugin 'tpope/vim-fugitive'
" syntax highlighting for coffeescript
Plugin 'kchmck/vim-coffee-script'
" syntax and indent plugins for js
Plugin 'pangloss/vim-javascript'
" syntax for capistrano tasks
Plugin 'ain/vim-capistrano'
" nerdtree is kind of toolbar
Plugin 'scrooloose/nerdtree'
" asynchronous :make using Neovim's job-control functionality
Plugin 'benekastah/neomake'
" comment blocks of code
Plugin 'scrooloose/nerdcommenter'
" html5
Plugin 'othree/html5.vim'
" markdown
Plugin 'godlygeek/tabular'
" es6, react.js
Plugin 'mxw/vim-jsx'
" color scheme
Plugin 'w0ng/vim-hybrid'
" search in project
Plugin 'mileszs/ack.vim'
" clojure
Plugin 'guns/vim-clojure-static'
" elm
Plugin 'lambdatoast/elm.vim'
" editorconfig
Plugin 'editorconfig/editorconfig-vim'
" proper tmux syntax highlighting
Plugin 'tmux-plugins/vim-tmux'
" some strange stuff
Plugin 'floobits/floobits-neovim'
" start screen
Plugin 'mhinz/vim-startify'
" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------------------------------------

au BufRead,BufNewFile *.rabl setf ruby
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
"set ttyfast
"set lazyredraw
" Add the g flag to search/replace by default
set gdefault
" Use en lang for messages
let $LANG = 'en_US'
" Use UTF-8 without BOM
"set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Backups are for pussies
set nobackup
set noswapfile
" Use ack instead of grep
set grepprg=ack
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
"set number
" Enable syntax highlighting
syntax on
" Highlight current line
"set cursorline
" By default it is preview,menuone
set completeopt=menuone
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
"set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
noremap <leader>l :nohl<CR>
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
"set nostartofline
" set same color for end tag in jsx
highlight link xmlEndTag xmlTag
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Number of pixel lines to use between characters¬
set lsp=1
" NerdTree style for project list (file-tree)
let g:netrw_liststyle=3
" Tweak CTRL-P
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Open NERDTree and highlight current file by \n
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>
" Open new tab
nmap <silent><leader>to :tabnew .<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Coffeelint options
let coffee_lint_options = '-f ~/.coffeelint.json'
" Markdown latex math escaping
let g:vim_markdown_math=1
" Use JSX syntax in .js files
let g:jsx_ext_required = 0

" Setup syntax checkers
if filereadable('.eslintrc')
  let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
else
  let g:neomake_javascript_enabled_makers = ['standard']
  let g:neomake_jsx_enabled_makers = ['standard']
endif
autocmd! BufWritePost * Neomake

function! s:standard()
  let g:neomake_javascript_enabled_makers = ['standard']
  let g:neomake_jsx_enabled_makers = ['standard']
  Neomake
endfunction
command! Standard :call <SID>standard()

function! s:eslint()
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  Neomake
endfunction
command! Eslint :call <SID>eslint()

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " Treat .boot files as Clojure
  autocmd BufNewFile,BufRead *.boot setlocal filetype=clojure
endif