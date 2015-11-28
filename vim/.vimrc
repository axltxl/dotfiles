""""""""""""""""""""""""""""""""""""
" Vim/NeoVim main configuration file
""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""

" Essentials go first
source ~/.vim/startup/essentials.vim

" vim-plug
call plug#begin()


" Must haves
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'benekastah/neomake'
Plug 'jimsei/winresizer'
Plug 'djoshea/vim-autoread'

" Autocompletion
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer --clang-completer'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" golang
Plug 'fatih/vim-go', {'for': ['go']}

" Add plugins to &runtimepath
call plug#end() " vim-plug


""""""""""""""""""""""
" Load custom settings
""""""""""""""""""""""

" Get color scheme
source ~/.vim/colors/base16.vim

" Look and feel settings
source ~/.vim/startup/lookandfeel.vim

" custom keyboard mappings go in here
source ~/.vim/startup/mappings.vim

" Plugins configuration
source ~/.vim/startup/plugins.vim

" auto-commands
source ~/.vim/startup/autocmds.vim
