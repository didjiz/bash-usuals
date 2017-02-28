
" Coloration
syntax on
"colorscheme default

" Conf diverse
set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nobackup

" Afficher le nom du fichier dans la bottom bar
set modeline
set ls=2

" Gestion des onglets
:map <F4> @:
:map <F6> <C-]>
:map <F7> :e# <CR>
map <C-t> :tabe <CR>  
map <C-w> :q <CR>  
noremap <S-Tab> :tabp<CR>
noremap <Tab> :tabn<CR>

" Fautes de frappes ...
:command W w
:command Q q
:command WQ wq
:command Wq wq

" Indentations
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

