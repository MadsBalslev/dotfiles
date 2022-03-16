syntax on

set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set scrolloff=8
set nowrap

call plug#begin()
	Plug 'https://github.com/tpope/vim-surround'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'https://github.com/vim-airline/vim-airline'
	Plug 'https://github.com/preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'https://github.com/ryanoasis/vim-devicons'
	Plug 'https://github.com/dracula/vim'
	Plug 'https://github.com/airblade/vim-gitgutter'
call plug#end()

colorscheme dracula

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
