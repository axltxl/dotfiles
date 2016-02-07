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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'benekastah/neomake'
Plug 'djoshea/vim-autoread'
Plug 'airblade/vim-rooter'
Plug 'takac/vim-hardtime'

" look and feel
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'jimsei/winresizer'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --key-bindings --completion --no-update-rc' }
Plug 'junegunn/fzf.vim'

" Autocompletion
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer --clang-completer'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Java
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tfnico/vim-gradle'

" golang
Plug 'fatih/vim-go', {'for': ['go']}

" jinja2
Plug 'mitsuhiko/vim-jinja'

" Add plugins to &runtimepath
call plug#end() " vim-plug


""""""""""""""""""""""
" Load custom settings
""""""""""""""""""""""

" Get color scheme
source ~/.vim/colors/base16.vim"

" Look and feel settings
source ~/.vim/startup/lookandfeel.vim

" custom keyboard mappings go in here
source ~/.vim/startup/mappings.vim

" Plugins configuration
source ~/.vim/startup/plugins.vim

" auto-commands
source ~/.vim/startup/autocmds.vim

" custom settings go in here
if filereadable("~/.vim/startup/custom.vim")
    source ~/.vim/startup/custom.vim
endif
