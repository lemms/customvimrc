" Laurence's custom vimrc file

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
syntax enable

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

" Surround
" cs"' - Change surrounding quotes
" cs'<q> - Change quote to <q>
" cst" - Change tag to double quote
" ds" - Delete quotes
" ysiw] - Surround word with brackets
" ysiw{ - Surround word with brackets and spaces
" yss) - Surround line with parentheses
" ds{ - Delete surrounding braces
" yss<hello> - Surround line with <hello> tags
" [Visual mode] S<p class="important"> - Surround block with a tag

" :TlistToggle - Enable taglist

" Emmet
" html:5 <c-y>, - Create a html boilerplate
" ul#nav>li.item$*4{Item $} <c-y>, - Create an unordered list with 4 items
" See docs.emmet.io for details.

" Ack
" Run ack in vim:
" :Ack [options] {pattern} [{directories}]

" Fugitive
" Adds git support
" :Git status
" :Git diff

" Lawrencium
" Adds Mercurial support
" :Hgvdiff
" :Hgstatus
" :Hg commit - Executes hg

" Commentary
" [count]gcc - Comment out [count] lines
" gc[motion] - Comment out [motion] lines
" [Visual mode] gc - Comment out visual block
" :g/[regex]/Commentary - Comment out line containing [regex]
" :1,6Commentary - Comment out lines 1-6

call plug#begin()

Plug 'https://github.com/xolox/vim-misc'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/universal-ctags/ctags'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/ludovicchabant/vim-lawrencium'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --racer-completer --tern-completer
  endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

let g:rainbow_active = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

runtime macros/matchit.vim
