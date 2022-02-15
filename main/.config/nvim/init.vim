let mapleader=","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Code completion considered bloat
Plug 'JuliaEditorSupport/julia-vim'
Plug 'alx741/vim-hindent'
Plug 'godlygeek/tabular'
Plug 'gruvbox-community/gruvbox'
Plug 'jreybert/vimagit'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ojroques/nvim-hardline'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'tidalcycles/vim-tidal'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'zah/nim.vim'
Plug 'ziglang/zig.vim'

call plug#end()

colorscheme gruvbox
" Disable background
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

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
set signcolumn=no
set foldcolumn=0
set nofoldenable

set noswapfile
set nobackup
set undodir=~/.cache/vim/undodir
set undofile

lua require('hardline').setup {}

syntax on

" lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:tidal_target = "terminal"

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

autocmd BufRead,BufNewFile *.stacky set filetype=stacky
autocmd BufRead,BufNewFile *.porth set filetype=porth
autocmd BufRead,BufNewFile *.pl0 set filetype=pl0
autocmd BufNew,BufRead *.asm set ft=nasm

" Haskell configuration
let g:haskell_classic_highlighting = 1

" COC Configuration

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Git navigation

nmap <leader>gs :G<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Zen mode!
nnoremap <silent> <F1> :Goyo<CR>

" Pandoc like Markdown is what I mostly use so:

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Nicely print '#' as paragraphs, '-' as dots itp
let g:pandoc#syntax#conceal#use = 1

let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#spell#enabled = 0
let g:pandoc#formatting#textwidth = 119
let g:pandoc#syntax#conceal#blacklist = [ "block", "subscript", "superscript", "inlinecode" ]

let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Allow YAML, TOML and JSON as headers
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal = 0
