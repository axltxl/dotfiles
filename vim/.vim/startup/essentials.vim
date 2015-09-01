scriptencoding utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required


""""""""""""""""""
" Essentials
""""""""""""""""""""

set ttyfast        " Use a fast terminal connection
set t_Co=256       " Enable 256 colors
set showcmd        " Show partial commands in the last line of the screen

set hlsearch       " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
set number         " Display line numbers on the left
set nowrap         " No wordwrap, please!
set colorcolumn=80 " Set up a line length marker

"""""""""""""""""""""""
" Tabs and spaces
"""""""""""""""""""""""
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround

"""""""""""""""""""""""
" Disable stupid backup files and swap files by default
"""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Use the same symbols as TextMate for tabstops and EOLs
set list " whitespace is shown by default
set listchars=tab:▸\ ,eol:¬,trail:·,space:·