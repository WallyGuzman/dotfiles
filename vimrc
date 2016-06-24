" My vimrc file
"
" Maintainer:	Wally Guzman
" Last change:	Thu Jun 23 18:18:08 CDT 2016
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"Use Tim Pope's pathogen
execute pathogen#infect()

set rtp+=!/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'syntastic'

call vundle#end()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set line numbers
set number

" Set Syntax on
syntax enable

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Sets how many lines of history VIM has to remember
set history=700

" Do incremental searching
set incsearch

" Ignore case when searching
set ignorecase

" Except for initial capital letter
set smartcase

" Don't redraw
set lazyredraw

" Regex
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
set ffs=unix,dos,mac

" Enable filetype plugins
filetype plugin indent on
filetype indent on

" Live update
set autoread

" Infer indenting
set smartindent

" Four spaces to a tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Round shifts
set shiftround

" Wildcard menu for commands
set wildmenu

" Ignore the following files
set wildignore=*.o,*~,*.swp,*.pyc,*.class

" Don't wrap lines
set nowrap

" Use _ to seperate words
set iskeyword-=_

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

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" For easier split navigation
" nnoremap <Down>  <C-W><C-J>
" nnoremap <Up>    <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left>  <C-W><C-H>

" For buffer navigation
nnoremap <silent>  <Up>	   :bn<CR>
nnoremap <silent>  <Down>  :bp<CR>

" For easier switch to command mode
inoremap jj <Esc>

" Split naturally
set splitbelow
set splitright

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
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
