" vimrc based on stevelosh's (coming home to vim)
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"        for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Important .vimrc lines
filetype off
" call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
filetype plugin indent on
set pastetoggle=<F12> "http://simon.xn--schnbeck-p4a.dk/vim-paste-indent-problems/ 
" searching/moving (stevelosh)
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set nocompatible
set modelines=0
set encoding=utf-8

" my own
syntax on
set background=dark "for base16 colorscheme"
colorscheme base16-default
" make html with txt2tags. the CR gets rid of 'press ENTER to continue'
map <F5> :wall!<CR>:!txt2tags --toc -t html %<CR>:!dwbremote -a execute reload<CR><CR> 
map <c-f> :call JsBeautify()<cr>
  " or
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" mutt 
au BufRead /tmp/mutt-* set tw=72

" tab settings
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
