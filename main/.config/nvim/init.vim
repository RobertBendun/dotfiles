let mapleader=","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Code completion considered bloat
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

colorscheme gruvbox
set encoding=utf-8
set hidden
set ignorecase
set incsearch
set mouse=a
set nohlsearch
set noruler
set number relativenumber
set shiftwidth=0
set smartcase
set softtabstop=2
set splitbelow splitright
set tabstop=2
set termguicolors
set noerrorbells
set scrolloff=8
set signcolumn=yes

set noswapfile
set nobackup
set undodir=~/.cache/vim/undodir
set undofile


syntax on

" Autocompletion
set wildmode=longest,list,full

" highlight Normal guibg=NONE ctermbg=NONE

" Center after going to Insert Mode
autocmd InsertEnter * norm zz

" Use system's clipboard - let's try living without it, sometimes I just wonna
" edit in Vim!
" set clipboard+=unnamedplus

augroup Robert
	" Delete all trailing whitespace and newlines at the end of the file
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
augroup END

" Fix file types
autocmd BufRead,BufNewFile *.tex set filetype=tex

let mapleader = " "

" Nerd tree
map <leader>n :NERDTreeToggle<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
