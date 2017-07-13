set encoding=utf-8
set fileencoding=utf-8

set nobackup
set noswapfile
set autoread
set showcmd
set number
set cursorline
set ignorecase
set smartcase
set incsearch
set hlsearch

set statusline="%f%n%=%3l,%3c"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode

set background=dark

syntax enable

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/yunbox/.vim/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/yunbox/.vim/dein/')
  call dein#begin('/home/yunbox/.vim/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/yunbox/.vim/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
