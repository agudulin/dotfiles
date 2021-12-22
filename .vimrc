set hidden
" colorscheme alabaster
" Make Vim more useful
set autoread
" ------------------------------------------------------------
" required
filetype off
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
" find files with fzf
Plug 'junegunn/fzf'
" highlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'
" awesome vim
Plug 'tpope/vim-fugitive'
" nerdtree is kind of toolbar
Plug 'scrooloose/nerdtree'
" comment blocks of code
Plug 'scrooloose/nerdcommenter'
" html5
Plug 'othree/html5.vim'
" markdown
Plug 'godlygeek/tabular'

" syntax and indent plugins for js
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" search in project
Plug 'mileszs/ack.vim'
" clojure
Plug 'guns/vim-clojure-static'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" proper tmux syntax highlighting
Plug 'tmux-plugins/vim-tmux'
" %S/camelCase/woopWoop/gc
Plug 'tpope/tpope-vim-abolish'
" move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'
" clojure stuff
Plug 'tpope/vim-fireplace'
" handlebars
Plug 'mustache/vim-mustache-handlebars'
" display buffers
Plug 'ap/vim-buftabline'
" prettier
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': [
      \ 'javascript',
      \ 'javascriptreact',
      \ 'typescript',
      \ 'typescriptreact',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'yaml',
      \ 'json' ] }
Plug 'tomlion/vim-solidity'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
" init plugin system
call plug#end()
filetype plugin indent on
" ------------------------------------------------------------

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
"highlight link xmlEndTag xmlTag
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
"set title
" Show the (partial) command as it’s being typed
set showcmd
" Number of pixel lines to use between characters¬
set lsp=1
" NerdTree style for project list (file-tree)
let g:netrw_liststyle=3
" Add a space after comment delimeter
let NERDSpaceDelims=1

" Open NERDTree and highlight current file by \n
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>
" tabs
nmap <silent><leader>to :tabnew .<CR>
nmap gt :tabnext<CR>
nmap gT :tabprevious<CR>
" buffers
nmap <silent><leader>bo :enew<CR>
nmap <silent><leader>bl :ls<CR>
nmap <silent><leader>bq :bp <BAR> bd #<CR>
nmap <silent><leader>bn :bnext<CR>
nmap <silent><leader>bp :bprevious<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Use JSX syntax in .js files
let g:jsx_ext_required = 0

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Map Ctrl-P to fzf
noremap <C-P> :FZF<CR>
" use ag over ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

augroup plugin_prettier
  autocmd!
  autocmd BufWritePre *.js Prettier
  autocmd BufWritePre *.tsx Prettier
  autocmd BufWritePre *.jsx,*.mjs,*.ts,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml Prettier
augroup END

let g:prettier#config#arrow_parens = get(g:,'prettier#config#arrow_parens', 'always')

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = '--noemit --jsx'

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufNewFile,BufRead *.mdx setlocal filetype=markdown
  " Treat .boot files as Clojure
  autocmd BufNewFile,BufRead *.boot setlocal filetype=clojure
  autocmd BufNewFile,BufRead *.clar setlocal filetype=clojure

  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

endif

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(30, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#ac07e3