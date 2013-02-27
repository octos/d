" vimrc based on stevelosh's (coming home to vim)
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Important .vimrc lines
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

set encoding=utf-8

" my own
syntax on
colorscheme mustang

" ab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" make vim sane
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=65
"colorcolumn=65 matches 64-char limit on iPhone lock screen

" to do things right
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" no help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

"save upon losing focus
au FocusLost * :wa

set dictionary+=/usr/share/dict/words
