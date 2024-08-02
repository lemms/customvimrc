" Laurence's custom init.vim file

" Set scrolloff of 5 so that at least 5 lines around the cursor are visible
set scrolloff=5

" Show current position and line numbers
set ruler
set number

" 4 spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" indenting
set autoindent
set smartindent

" Use incremental search and highlight when searching
set incsearch
set hlsearch

" Prevent redraw when running macros
set lazyredraw

" Show matching brackets
set showmatch

" Match angle brackets <>
set matchpairs+=<:>

" Get rid of error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Syntax
syntax on

" Use utf8
set encoding=utf8

" Disable backup files
set nobackup
set nowb
set noswapfile

" Set 1000 lines of history
set history=1000

" Add filetype plugins
filetype plugin indent on

" Auto update file when it's changed outside Vim
set autoread

" Highlight cursor line number only
hi CursorLineNr cterm=bold ctermfg=red guifg=#af00af
set cursorline
set cursorlineopt=number

" Enable command line completion
set wildmenu
set wildmode=longest:full,full

" Speed up scrolling
set ttyfast

" Using vim-plug for plugin management
"
" Unix:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Windows:
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
"    ni $HOME/vimfiles/autoload/plug.vim -Force
"
" Run :PlugInstall to install plugins

" Navigating ctags
" :tn - Move to next definition
" :tn - Move to previous definition
" :tn - List all definitions
" ^] - Jump to definition
" ^t - Jump back from definition
" ^W} - Preview definition
" g] - See all definitions
"
" https://ricostacruz.com/til/navigate-code-with-ctags
"
" Language server protocol
" To install a LSP for your file, open the file in vim and type
" :LspInstallServer
" To uninstall a LSP type :LspUninstallServer <server name>

call plug#begin()

Plug 'https://github.com/universal-ctags/ctags'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'

call plug#end()

" Disable LSP diagnostics support
let g:lsp_diagnostics_enabled = 0

" Enable codedark color scheme
colorscheme codedark

set list
set listchars=tab:>-
