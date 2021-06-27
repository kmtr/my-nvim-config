let NVIM_CONFIG = '~/.config/nvim'

set ambiwidth=double
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set smartcase
set smartindent
set guicursor+=n:hor20-Cursor/lCursor
set ignorecase
set nrformats-=octal
set mouse=nvi
set number
set signcolumn=yes
set splitbelow
set title
set virtualedit=block
set visualbell
set whichwrap=b,s,[,],<,>

highlight MatchParen term=bold cterm=bold gui=bold ctermbg=DarkGray guibg=DargGray

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(NVIM_CONFIG . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'cespare/vim-toml'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thinca/vim-zenspace'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'

call plug#end()

call map(sort(split(globpath(NVIM_CONFIG, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
