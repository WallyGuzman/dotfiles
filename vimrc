" My vimrc file
"
" Maintainer:	Wally Guzman
" Last change:	Fri Sep  9 00:51:34 CDT 2016

"Use Tim Pope's pathogen
execute pathogen#infect()

set rtp+=!/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'

call vundle#end()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use system clipboard
set clipboard=unnamed

" Preserve undo across open/close
set undofile

" Use ; instead of :
" nnoremap ; :

" Set leader to space
let mapleader=","

" Repeat shifting
:vnoremap < <gv
:vnoremap > >gv

" sudo write
cmap w!! w !sudo tee %

" By far the most annoying part of Vim
command! W w
command! Q q
command! WQ wq
command! Wq wq

" airline config
" let g:airline#extensions#tabline#enabled=1
" let g:airline_theme="base16_solarized"

" Create tags from within vim
command! MakeTags !ctags -R .

" Make C-c play well with BufLeave
inoremap <C-c> <Esc>

" Save file
nnoremap <leader>s :w<CR>

" Show buffers
nnoremap <leader>ls :ls<CR>

" Add space below
nnoremap <C-j> o<Esc>k

" Add space above
nnoremap <C-k> O<Esc>j

" Turn off search highlight
nnoremap <leader><space> :noh<CR>

" Save file
nnoremap <leader>w :w<CR>

" Exit buffer
nnoremap <leader>q :q<CR>

" Open new split
nnoremap <leader>vs :vs<CR>

" Edit .vimrc
nnoremap <leader>vrc :vsp $MYVIMRC<CR>

" Source .vimrc
nnoremap <leader>src :source $MYVIMRC<CR>

" Open shell
nnoremap <leader>sh :sh<CR>

" Toggle pasting
set pastetoggle=<leader>p

" Toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Switch between relative and absolute line numbers
nnoremap <leader>n :call ToggleNumber()<CR>

" Global replace on lines
set gdefault

" No more than 80 characters per line
set textwidth=80

" Set line numbers
set number

" Set Syntax on
syntax enable

" Normal backspace
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Display invisible characters
set nolist
set listchars=tab:▸\ ,eol:¬

" Don't close buffers
set hidden

" Large history size
set history=500

" Large undo size
set undolevels=500

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Move across wrapped lines
nnoremap j gj
nnoremap k gk

" Ignore case when searching
set ignorecase

" Except for initial capital letter
set smartcase

" Don't redraw
set lazyredraw

" At least five lines above and below
" set scrolloff=5

" Security vulnerability?
set modelines=0

" Regex magic
set magic

" Show matching bracket
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set UTF-8 as default
set encoding=utf8

" Use unix as standard
set ffs=unix,mac,dos

" Enable filetype plugins
filetype plugin indent on
filetype indent on

" Live update
set autoread

" Infer indenting
set smartindent

" Always indent automatically
set autoindent

" Copy last indentation level
set copyindent

" Four spaces to a tab
set expandtab       " TAB characters are spaces
set smarttab
set shiftwidth=4
set tabstop=4       " Number of visual spaces per TAB
set softtabstop=4   " Number of spaces in TAB when editing

" Always terminate with LF
set fileformat=unix

" Highlight cursor line
" set cursorline

" Round shifts
set shiftround

" Wildcard menu for commands
set wildmenu

" Search down into subfolders
set path+=**

" Completion
" set complete-=i 

" Wild mode for autocomplete
set wildmode=list:longest,list:full

" Ignore the following files
set wildignore=*.o,*~,*.swp,*.pyc,*.class

" Don't wrap lines
set nowrap

" Use _,- to separate words
" set iskeyword-=_
" set iskeyword+=-

" Show mode
set showmode

" Show current command
set showcmd

" Allow modelines
set modeline

" Show row and column
set ruler

" Always show status line
set laststatus=2

" Use Q for formatting the current paragraph (or selection)
nnoremap Q gq
vmap Q gq
nmap Q gqap

" Use Tab to switch back and forth
nnoremap <TAB> :b#<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" For easier split navigation
" nnoremap <Down>  <C-W><C-J>
" nnoremap <Up>    <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left>  <C-W><C-H>

" Alternative navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" For buffer navigation
nnoremap <silent>  <Up>	   :bn<CR>
nnoremap <silent>  <Down>  :bp<CR>

" For easier switch to command mode
inoremap jj <Esc>

" Split naturally
set splitbelow
set splitright

" if has("autocmd")
"     au BufNewFile,BufRead *.py
"         \ set tabstop=4
"         \ set nolisp
"         \ set softtabstop=4
"         \ set shiftwidth=4
"         \ set textwidth=79
"         \ set expandtab
"         \ set autoindent
"         \ set fileformat=unix
" endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
