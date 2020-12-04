if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'

call plug#end()

colorscheme codedark
set encoding=utf-8
set ignorecase
set mouse=a
set noruler
set number relativenumber
set shiftwidth=0
set smartcase
set softtabstop=2
set splitbelow splitright
set tabstop=2
set termguicolors
syntax on

" Autocompletion
set wildmode=longest,list,full

" highlight Normal guibg=NONE ctermbg=NONE

" Center after going to Insert Mode
autocmd InsertEnter * norm zz


" Use system's clipboard
set clipboard+=unnamedplus

" Delete all trailing whitespace and newlines at the end of the file

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Fix file types
autocmd BufRead,BufNewFile *.tex set filetype=tex